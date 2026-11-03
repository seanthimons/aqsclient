#' Returns meta data for each service
#' 
#' @noMd
#' @param email User ID (email address). Defaults to the AQS_EMAIL environment variable.
#' @param service Service name
#' @return Decoded response returned by the client request helper.
#' @family metaData endpoints
#' @export
# Generated with specmill; do not edit by hand.
meta_data_fields_by_service <- function(email = base::Sys.getenv("AQS_EMAIL", unset = ""), service) {
  if (base::is.null(email) || base::length(email) != 1L || base::is.na(email) || !base::nzchar(email)) base::stop("Supply email or set AQS_EMAIL")
  if (base::is.null(service)) base::stop("Required input: service")
  .api_validation$parameter_values(base::list("email" = email, "service" = service), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), service = list(name = "service", "in" = "query", description = "Service name", type = "string", "x-example" = "sampleData")), .api_validation$body_value, c(email = "query", service = "query"))
  params <- base::list("email" = email, "service" = service)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["service"]]) && base::any(!base::nzchar(params[["service"]]))) base::stop("Empty query parameter: service")
  result <- api_request(method = "GET", path = "/metaData/fieldsByService", path_params = base::list(), query = base::list("email" = params[["email"]], "service" = params[["service"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQS_KEY"))))
  result
}

#' Ping to see if API service is working
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family metaData endpoints
#' @export
# Generated with specmill; do not edit by hand.
meta_data_is_available <- function() {
  params <- base::list()
  result <- api_request(method = "GET", path = "/metaData/isAvailable", path_params = base::list(), query = base::list(), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQS_KEY"))))
  result
}

#' Returns notices to changes to services, documentation, web pages, historical data, etc
#' 
#' @noMd
#' @param email User ID (email address). Defaults to the AQS_EMAIL environment variable.
#' @return Decoded response returned by the client request helper.
#' @family metaData endpoints
#' @export
# Generated with specmill; do not edit by hand.
meta_data_revision_history <- function(email = base::Sys.getenv("AQS_EMAIL", unset = "")) {
  if (base::is.null(email) || base::length(email) != 1L || base::is.na(email) || !base::nzchar(email)) base::stop("Supply email or set AQS_EMAIL")
  .api_validation$parameter_values(base::list("email" = email), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api")), .api_validation$body_value, c(email = "query"))
  params <- base::list("email" = email)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  result <- api_request(method = "GET", path = "/metaData/revisionHistory", path_params = base::list(), query = base::list("email" = params[["email"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQS_KEY"))))
  result
}

#' Returns known issues with the API
#' 
#' @noMd
#' @param email User ID (email address). Defaults to the AQS_EMAIL environment variable.
#' @return Decoded response returned by the client request helper.
#' @family metaData endpoints
#' @export
# Generated with specmill; do not edit by hand.
meta_data_issues <- function(email = base::Sys.getenv("AQS_EMAIL", unset = "")) {
  if (base::is.null(email) || base::length(email) != 1L || base::is.na(email) || !base::nzchar(email)) base::stop("Supply email or set AQS_EMAIL")
  .api_validation$parameter_values(base::list("email" = email), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api")), .api_validation$body_value, c(email = "query"))
  params <- base::list("email" = email)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  result <- api_request(method = "GET", path = "/metaData/issues", path_params = base::list(), query = base::list("email" = params[["email"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQS_KEY"))))
  result
}
