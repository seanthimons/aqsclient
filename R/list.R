#' Returns a list of state codes
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @return Decoded response returned by the client request helper.
#' @family list endpoints
#' @export
# Generated with specmill; do not edit by hand.
list_states <- function(email, key) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  .api_validation$parameter_values(base::list("email" = email, "key" = key), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test")), .api_validation$body_value, c(email = "query", key = "query"))
  params <- base::list("email" = email, "key" = key)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  result <- api_request(method = "GET", path = "/list/states", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))))
  result
}

#' Returns a list of county codes in the provided state
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @param state State FIPS code - must be two digits including leading zero  Use the list/states service for a list of state codes (e.g., https://aqs.epa.gov/data/api/list/states?email=test@@aqs.api&key=test).
#' 
#' @return Decoded response returned by the client request helper.
#' @family list endpoints
#' @export
# Generated with specmill; do not edit by hand.
list_counties_by_state <- function(email, key, state) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  if (base::is.null(state)) base::stop("Required input: state")
  .api_validation$parameter_values(base::list("email" = email, "key" = key, "state" = state), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test"), state = list(name = "state", "in" = "query", description = "State FIPS code - must be two digits including leading zero  Use the list/states service for a list of state codes (e.g., https://aqs.epa.gov/data/api/list/states?email=test@aqs.api&key=test).\n", type = "string", 
    minLength = 2L, maxLength = 2L, pattern = "^[0-9][0-9]$", "x-example" = "16")), .api_validation$body_value, c(email = "query", key = "query", state = "query"))
  params <- base::list("email" = email, "key" = key, "state" = state)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  if (base::is.character(params[["state"]]) && base::any(!base::nzchar(params[["state"]]))) base::stop("Empty query parameter: state")
  result <- api_request(method = "GET", path = "/list/countiesByState", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]], "state" = params[["state"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))))
  result
}

#' Returns a list of site numbers in the given county
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @param state State FIPS code - must be two digits including leading zero  Use the list/states service for a list of state codes (e.g., https://aqs.epa.gov/data/api/list/states?email=test@@aqs.api&key=test).
#' 
#' @param county County FIPS code - must be three digits including leading zeroes.
#' @return Decoded response returned by the client request helper.
#' @family list endpoints
#' @export
# Generated with specmill; do not edit by hand.
list_sites_by_county <- function(email, key, state, county) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  if (base::is.null(state)) base::stop("Required input: state")
  if (base::is.null(county)) base::stop("Required input: county")
  .api_validation$parameter_values(base::list("email" = email, "key" = key, "state" = state, "county" = county), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test"), state = list(name = "state", "in" = "query", description = "State FIPS code - must be two digits including leading zero  Use the list/states service for a list of state codes (e.g., https://aqs.epa.gov/data/api/list/states?email=test@aqs.api&key=test).\n", type = "string", 
    minLength = 2L, maxLength = 2L, pattern = "^[0-9][0-9]$", "x-example" = "16"), county = list(name = "county", "in" = "query", description = "County FIPS code - must be three digits including leading zeroes.", type = "string", minLength = 3L, maxLength = 3L, pattern = "^[0-9][0-9][0-9]$", "x-example" = "001")), .api_validation$body_value, c(email = "query", key = "query", state = "query", county = "query"))
  params <- base::list("email" = email, "key" = key, "state" = state, "county" = county)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  if (base::is.character(params[["state"]]) && base::any(!base::nzchar(params[["state"]]))) base::stop("Empty query parameter: state")
  if (base::is.character(params[["county"]]) && base::any(!base::nzchar(params[["county"]]))) base::stop("Empty query parameter: county")
  result <- api_request(method = "GET", path = "/list/sitesByCounty", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]], "state" = params[["state"]], "county" = params[["county"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))))
  result
}

#' Returns a list of CBSA (metro area) codes
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @return Decoded response returned by the client request helper.
#' @family list endpoints
#' @export
# Generated with specmill; do not edit by hand.
list_cbsas <- function(email, key) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  .api_validation$parameter_values(base::list("email" = email, "key" = key), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test")), .api_validation$body_value, c(email = "query", key = "query"))
  params <- base::list("email" = email, "key" = key)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  result <- api_request(method = "GET", path = "/list/cbsas", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))))
  result
}

#' Returns a list of classes (groups) of parameters
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @return Decoded response returned by the client request helper.
#' @family list endpoints
#' @export
# Generated with specmill; do not edit by hand.
list_classes <- function(email, key) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  .api_validation$parameter_values(base::list("email" = email, "key" = key), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test")), .api_validation$body_value, c(email = "query", key = "query"))
  params <- base::list("email" = email, "key" = key)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  result <- api_request(method = "GET", path = "/list/classes", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))))
  result
}

#' Returns a list of parameter codes in the provided class.  "ALL" is a valid class
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @param pc Parameter class
#' @return Decoded response returned by the client request helper.
#' @family list endpoints
#' @export
# Generated with specmill; do not edit by hand.
list_parameters_by_class <- function(email, key, pc) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  if (base::is.null(pc)) base::stop("Required input: pc")
  .api_validation$parameter_values(base::list("email" = email, "key" = key, "pc" = pc), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test"), pc = list(name = "pc", "in" = "query", description = "Parameter class", type = "string", default = "ALL")), .api_validation$body_value, c(email = "query", key = "query", pc = "query"))
  params <- base::list("email" = email, "key" = key, "pc" = pc)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  if (base::is.character(params[["pc"]]) && base::any(!base::nzchar(params[["pc"]]))) base::stop("Empty query parameter: pc")
  result <- api_request(method = "GET", path = "/list/parametersByClass", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]], "pc" = params[["pc"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))))
  result
}

#' Returns a list of primary quality assurance organization codes
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @return Decoded response returned by the client request helper.
#' @family list endpoints
#' @export
# Generated with specmill; do not edit by hand.
list_pqaos <- function(email, key) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  .api_validation$parameter_values(base::list("email" = email, "key" = key), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test")), .api_validation$body_value, c(email = "query", key = "query"))
  params <- base::list("email" = email, "key" = key)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  result <- api_request(method = "GET", path = "/list/pqaos", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))))
  result
}

#' Returns a list of monitoring agency codes
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @return Decoded response returned by the client request helper.
#' @family list endpoints
#' @export
# Generated with specmill; do not edit by hand.
list_mas <- function(email, key) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  .api_validation$parameter_values(base::list("email" = email, "key" = key), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test")), .api_validation$body_value, c(email = "query", key = "query"))
  params <- base::list("email" = email, "key" = key)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  result <- api_request(method = "GET", path = "/list/mas", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))))
  result
}
