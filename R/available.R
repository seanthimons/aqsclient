#' Ping to see if the service is working
#' 
#' @noMd
#' @return Decoded response returned by the client request helper.
#' @family available endpoints
#' @export
# Generated with specmill; do not edit by hand.
service_available <- function() {
  params <- base::list()
  result <- api_request(method = "GET", path = "/serviceAvailable", path_params = base::list(), query = base::list(), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list())
  result
}
