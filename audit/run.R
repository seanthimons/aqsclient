# Run from the aqsclient directory: Rscript audit/run.R
root <- normalizePath('.')
readRenviron(file.path(root, '.Renviron'))
stopifnot(nzchar(Sys.getenv('AQS_EMAIL')), nzchar(Sys.getenv('AQS_KEY')))
runtime <- new.env(parent = baseenv())
for (file in list.files(file.path(root, 'R'), full.names = TRUE)) sys.source(file, runtime)
runtime$set_api_token(Sys.getenv('AQS_KEY'))
Sys.unsetenv('AQSCLIENT_DRY_RUN')
options(aqsclient.request = list(timeout = 30, max_retries = 0))
name_map <- list()
for (file in list.files(file.path(root, 'apis'), full.names = TRUE)) {
  name_map <- c(name_map, yaml::read_yaml(file)$names)
}
ops <- specmill::read_operations(file.path(root, 'schema/openapi.json'), policy = list(names = name_map))$operations
# Start with lookups, then data. All requests remain sequential.
ops <- ops[order(!grepl('^/(list|metaData|serviceAvailable)', vapply(ops, `[[`, '', 'path')))]
safe <- function(x) {
  x <- paste(unlist(x), collapse = '; ')
  for (secret in c(Sys.getenv('AQS_EMAIL'), Sys.getenv('AQS_KEY'))) {
    x <- gsub(secret, '[redacted]', x, fixed = TRUE)
    x <- gsub(utils::URLencode(secret, reserved = TRUE), '[redacted]', x, fixed = TRUE)
  }
  gsub('https?://[^[:space:]]+', '[URL omitted]', x)
}
rows <- list()
if (file.exists('audit/results.csv')) {
  previous <- read.csv('audit/results.csv', stringsAsFactors = FALSE, na.strings = 'NA')
  previous <- previous[!grepl('unused argument', previous$detail), ]
  rows <- lapply(seq_len(nrow(previous)), function(i) previous[i, ])
}
for (op in ops) {
  if (length(rows) && op$path %in% vapply(rows, function(x) x$path, '')) next
  started <- Sys.time()
  args <- list()
  for (p in op$parameters) {
    if (!isTRUE(p$required) && p$name != 'param') next
    value <- p[['x-example']]
    if (is.null(value)) value <- p$example
    args[[p$name]] <- value
  }
  defaults <- list(email = Sys.getenv('AQS_EMAIL'), key = Sys.getenv('AQS_KEY'),
                   param = '88101', bdate = 20180301L, edate = 20180301L,
                   state = '16', county = '001', site = '0010', cbsa = '14260',
                   pqao = '0511', agency = '0511', poc = '1', pc = 'CRITERIA',
                   service = 'sampleData', minlat = 43.6, maxlat = 43.7,
                   minlon = -116.5, maxlon = -116.0)
  names_needed <- vapply(Filter(function(p) isTRUE(p$required) || p$name == 'param', op$parameters), `[[`, '', 'name')
  for (name in intersect(names_needed, names(defaults))) args[[name]] <- defaults[[name]]
  if (grepl('^/(qa|transactionsQa)', op$path)) args$edate <- 20180331L
  if (grepl('AnnualPerformance', op$path)) args$param <- '44201'
  status <- ''; detail <- ''; count <- NA_integer_
  if (op$path == '/signup') {
    outcome <- 'skipped_side_effect'
    detail <- 'Creates account or resets key and sends email.'
  } else {
    response <- tryCatch(do.call(runtime[[op$name]], args), error = identity)
    if (inherits(response, 'error')) {
      outcome <- 'error'; detail <- safe(conditionMessage(response))
    } else if (is.list(response) && !is.null(response$Header)) {
      header <- response$Header[[1]]
      status <- safe(header$status)
      count <- length(response$Data)
      detail <- safe(header$error)
      outcome <- if (status == 'Success') 'success' else if (grepl('No data', status, ignore.case = TRUE)) 'no_data' else 'api_status'
    } else {
      outcome <- 'unexpected_response'
      detail <- paste('Response class:', paste(class(response), collapse = ','))
    }
  }
  public_args <- args[setdiff(names(args), c('email', 'key'))]
  rows[[length(rows) + 1L]] <- data.frame(
    path = op$path, function_name = op$name, outcome = outcome, api_status = status,
    rows = count, seconds = round(as.numeric(difftime(Sys.time(), started, units = 'secs')), 2),
    inputs = as.character(jsonlite::toJSON(public_args, auto_unbox = TRUE)), detail = detail
  )
  write.csv(do.call(rbind, rows), file.path(root, 'audit/results.csv'), row.names = FALSE)
  cat(length(rows), '/', length(ops), op$path, outcome, status, count, detail, '\n')
  flush.console()
  if (op$path != '/signup') Sys.sleep(6.2)
}
