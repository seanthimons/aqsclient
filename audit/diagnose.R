# Run after audit/run.R. Only retry endpoints that need response inspection.
readRenviron('.Renviron')
e <- new.env(parent = baseenv())
for (file in list.files('R', full.names = TRUE)) sys.source(file, e)
e$set_api_token(Sys.getenv('AQS_KEY'))
options(aqsclient.request = list(timeout = 30, max_retries = 0))
safe <- function(x) {
  text <- paste(unlist(x), collapse = '; ')
  for (secret in c(Sys.getenv('AQS_EMAIL'), Sys.getenv('AQS_KEY'))) {
    text <- gsub(secret, '[redacted]', text, fixed = TRUE)
    text <- gsub(utils::URLencode(secret, reserved = TRUE), '[redacted]', text, fixed = TRUE)
  }
  gsub('https?://[^[:space:]]+', '[URL omitted]', text)
}
baseline <- read.csv('audit/results.csv')
selected <- baseline[baseline$outcome %in% c('error', 'unexpected_response'), ]
rows <- list()
for (i in seq_len(nrow(selected))) {
  row <- selected[i, ]
  args <- jsonlite::fromJSON(row$inputs, simplifyVector = FALSE)
  credentials <- list(email = Sys.getenv('AQS_EMAIL'), key = Sys.getenv('AQS_KEY'))
  for (name in intersect(names(formals(e[[row$function_name]])), names(credentials))) args[[name]] <- credentials[[name]]
  Sys.setenv(AQSCLIENT_DRY_RUN = 'true')
  request <- do.call(e[[row$function_name]], args)
  request <- httr2::req_error(request, is_error = function(response) FALSE)
  response <- tryCatch(httr2::req_perform(request), error = identity)
  if (inherits(response, 'error')) {
    record <- data.frame(path = row$path, http = NA, content_type = '', detail = 'Transport failed')
  } else {
    text <- httr2::resp_body_string(response)
    body <- tryCatch(jsonlite::fromJSON(text, simplifyVector = FALSE), error = function(e) NULL)
    detail <- if (is.list(body) && !is.null(body$Header)) safe(body$Header[[1]][c('status','error','rows')]) else safe(substr(text, 1, 400))
    record <- data.frame(path = row$path, http = httr2::resp_status(response), content_type = paste(httr2::resp_header(response, 'content-type'), collapse = ''), detail = detail)
  }
  rows[[i]] <- record
  write.csv(do.call(rbind, rows), 'audit/diagnostics.csv', row.names = FALSE)
  cat(row$path, record$http, record$content_type, record$detail, '\n')
  Sys.sleep(6.2)
}
