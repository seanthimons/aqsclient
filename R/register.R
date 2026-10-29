#' Request an account by providing an email address
#' 
#' @noMd
#' @param email User ID (email address)
#' @return Decoded response returned by the client request helper.
#' @family register endpoints
#' @export
# Generated with specmill; do not edit by hand.
signup <- function(email) {
  if (base::is.null(email)) base::stop("Required input: email")
  .api_validation$parameter_values(base::list("email" = email), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api")), .api_validation$body_value, c(email = "query"))
  params <- base::list("email" = email)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  result <- api_request(method = "GET", path = "/signup", path_params = base::list(), query = base::list("email" = params[["email"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQS_KEY"))))
  result
}
