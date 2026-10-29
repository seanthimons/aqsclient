library(aqsclient)

check_requests <- function() {
  variables <- c('AQS_KEY', 'AQSCLIENT_DRY_RUN', 'AQSCLIENT_AQS_API_AUTH')
  previous <- stats::setNames(Sys.getenv(variables, unset = NA_character_), variables)
  on.exit({
    Sys.unsetenv(variables)
    present <- !is.na(previous)
    if (any(present)) do.call(Sys.setenv, as.list(previous[present]))
  }, add = TRUE)
  Sys.setenv(AQSCLIENT_DRY_RUN = 'true', AQS_KEY = 'fake-aqs-first+/=&')
  Sys.unsetenv('AQSCLIENT_AQS_API_AUTH')
  query <- function(request) {
    pairs <- strsplit(sub('^[^?]*\\?', '', request$url), '&', fixed = TRUE)[[1]]
    keys <- vapply(strsplit(pairs, '=', fixed = TRUE), `[[`, character(1), 1L)
    values <- vapply(pairs, function(x) utils::URLdecode(sub('^[^=]*=', '', x)), character(1))
    stats::setNames(values, keys)
  }
  inputs <- list(
    email = 'offline@example.org', param = c('44201', '88101'),
    bdate = 20180303L, edate = 20180303L, state = '16', county = '001',
    site = '0010', cbsa = '14260', minlat = 43.6, maxlat = 43.7,
    minlon = -116.5, maxlon = -116.0, pqao = '0511', agency = '0511',
    pc = 'CRITERIA', poc = '1', service = 'sampleData'
  )
  exports <- getNamespaceExports('aqsclient')
  routes <- Filter(function(name) {
    f <- getExportedValue('aqsclient', name)
    is.function(f) && 'email' %in% names(formals(f)) && name != 'signup'
  }, exports)
  stopifnot(length(routes) == 76L)
  for (name in routes) {
    f <- getExportedValue('aqsclient', name)
    stopifnot(!'key' %in% names(formals(f)))
    args <- inputs[intersect(names(inputs), names(formals(f)))]
    first <- query(do.call(f, args))
    stopifnot(sum(names(first) == 'key') == 1L,
              identical(unname(first['key']), 'fake-aqs-first+/=&'),
              identical(unname(first['email']), inputs$email))
    Sys.setenv(AQS_KEY = 'fake-aqs-second')
    second <- query(do.call(f, args))
    stopifnot(sum(names(second) == 'key') == 1L,
              identical(unname(second['key']), 'fake-aqs-second'))
    # Dry-run mode returns before transport; missing credentials must fail even here.
    for (missing in list(NULL, '', '   ')) {
      if (is.null(missing)) Sys.unsetenv('AQS_KEY') else Sys.setenv(AQS_KEY = missing)
      error <- tryCatch(do.call(f, args), error = identity)
      stopifnot(inherits(error, 'error'), grepl('AQS_KEY', conditionMessage(error), fixed = TRUE))
    }
    Sys.setenv(AQS_KEY = 'fake-aqs-first+/=&')
  }
  # Public status must still work with no key. Registration is never invoked.
  Sys.unsetenv('AQS_KEY')
  stopifnot(identical(service_available()$url, 'https://aqs.epa.gov/data/api/serviceAvailable'))
  stopifnot(identical(names(formals(signup)), 'email'))
  Sys.setenv(AQS_KEY = 'fake-aqs-first+/=&')
  stopifnot(identical(unname(query(meta_data_is_available())['key']), 'fake-aqs-first+/=&'))
  error <- tryCatch(list_states(email = inputs$email, key = 'fake-explicit'), error = identity)
  stopifnot(inherits(error, 'error'))
  # Environment lookup does not sanitize the actual request object or its printing.
  printed <- capture.output(print(list_states(email = inputs$email)))
  stopifnot(any(grepl('fake-aqs-first', printed, fixed = TRUE)))
  cat('Offline auth checks passed for all 76 credential-bearing query wrappers.\n')
}

check_requests()
