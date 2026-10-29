readRenviron('.Renviron')
e <- new.env(parent = baseenv())
for (file in list.files('R', full.names = TRUE)) sys.source(file, e)
e$set_api_token(Sys.getenv('AQS_KEY'))
Sys.unsetenv('AQSCLIENT_DRY_RUN')
options(aqsclient.request = list(timeout = 30, max_retries = 0))
baseline <- read.csv('audit/results.csv', stringsAsFactors = FALSE)
selected <- baseline[grepl('^/transactionsSample/', baseline$path), ]
rows <- list()
for (i in seq_len(nrow(selected))) {
  row <- selected[i, ]
  args <- jsonlite::fromJSON(row$inputs, simplifyVector = FALSE)
  args$email <- Sys.getenv('AQS_EMAIL'); args$key <- Sys.getenv('AQS_KEY')
  args['units'] <- list(NULL)
  response <- tryCatch(do.call(e[[row$function_name]], args), error = identity)
  status <- if (inherits(response, 'error')) conditionMessage(response) else response$Header[[1]]$status
  count <- if (inherits(response, 'error')) NA_integer_ else length(response$Data)
  rows[[i]] <- data.frame(path = row$path, status = status, rows = count, adjustment = 'units = NULL')
  write.csv(do.call(rbind, rows), 'audit/transaction-workaround.csv', row.names = FALSE)
  cat(row$path, status, count, '\n')
  Sys.sleep(6.2)
}
