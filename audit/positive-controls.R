# Follow-up queries for baseline empty results; run after the main sweep.
readRenviron('.Renviron')
e <- new.env(parent = baseenv())
for (file in list.files('R', full.names = TRUE)) sys.source(file, e)
e$set_api_token(Sys.getenv('AQS_KEY'))
Sys.unsetenv('AQSCLIENT_DRY_RUN')
options(aqsclient.request = list(timeout = 30, max_retries = 0))
baseline <- read.csv('audit/results.csv', stringsAsFactors = FALSE)
selected <- baseline[grepl('^/(sampleData|dailyData)/by(Site|County|CBSA|Box)$|^/qaOnePointQcRawData/|^/qaAnnualPerformanceEvaluations/byState$', baseline$path), ]
rows <- list()
for (i in seq_len(nrow(selected))) {
  row <- selected[i, ]
  args <- jsonlite::fromJSON(row$inputs, simplifyVector = FALSE)
  args$email <- Sys.getenv('AQS_EMAIL'); args$key <- Sys.getenv('AQS_KEY')
  if (grepl('^/(sampleData|dailyData)', row$path)) {
    args$bdate <- args$edate <- 20180303L
    change <- 'Try March 3 instead of March 1 for PM2.5.'
  } else if (grepl('qaOnePoint', row$path)) {
    args$param <- '44201'
    change <- 'Use ozone for gas-analyzer one-point QC instead of PM2.5.'
  } else {
    args$state <- '01'; args$bdate <- 20170101L; args$edate <- 20171231L
    change <- 'Use EPA documented Alabama 2017 ozone example.'
  }
  response <- tryCatch(do.call(e[[row$function_name]], args), error = identity)
  status <- if (inherits(response, 'error')) 'Request failed' else response$Header[[1]]$status
  count <- if (inherits(response, 'error')) NA_integer_ else length(response$Data)
  public <- args[setdiff(names(args), c('email', 'key'))]
  rows[[i]] <- data.frame(path = row$path, status = status, rows = count, change = change,
                          inputs = as.character(jsonlite::toJSON(public, auto_unbox = TRUE)))
  write.csv(do.call(rbind, rows), 'audit/positive-controls.csv', row.names = FALSE)
  cat(row$path, status, count, '\n')
  Sys.sleep(6.2)
}
