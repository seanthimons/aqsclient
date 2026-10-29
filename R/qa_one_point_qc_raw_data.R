#' Returns QA one point QC raw data by state
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @param param Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@@aqs.api&key=test&pc=CRITERIA)
#' 
#' @param bdate Begin date of data (YYYYMMDD).  For example 20100101.
#' @param edate End date of data (YYYYMMDD).  For example 20101231.
#' @param cbdate Beginning of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.
#' 
#' @param cedate End of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.
#' 
#' @param state State FIPS code - must be two digits including leading zero  Use the list/states service for a list of state codes (e.g., https://aqs.epa.gov/data/api/list/states?email=test@@aqs.api&key=test).
#' 
#' @return Decoded response returned by the client request helper.
#' @family qaOnePointQcRawData endpoints
#' @export
# Generated with specmill; do not edit by hand.
qa_one_point_qc_raw_data_by_state <- function(email, key, param, bdate, edate, cbdate = NULL, cedate = NULL, state) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  if (base::is.null(param)) base::stop("Required input: param")
  if (base::is.null(bdate)) base::stop("Required input: bdate")
  if (base::is.null(edate)) base::stop("Required input: edate")
  if (base::is.null(state)) base::stop("Required input: state")
  .api_validation$parameter_values(base::list("email" = email, "key" = key, "param" = param, "bdate" = bdate, "edate" = edate, "cbdate" = cbdate, "cedate" = cedate, "state" = state), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test"), param = list(name = "param", "in" = "query", description = "Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@aqs.api&key=test&pc=CRITERIA)\n", 
    type = "array", items = list(type = "string", minLength = 5L, maxLength = 5L, pattern = "^[0-9][0-9][0-9][0-9][0-9]$"), collectionFormat = "csv", "x-example" = "88101,44201"), bdate = list(name = "bdate", "in" = "query", description = "Begin date of data (YYYYMMDD).  For example 20100101.", type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180301L), edate = list(name = "edate", 
    "in" = "query", description = "End date of data (YYYYMMDD).  For example 20101231.", type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180331L), cbdate = list(name = "cbdate", "in" = "query", description = "Beginning of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.\n", 
    type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180101L), cedate = list(name = "cedate", "in" = "query", description = "End of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.\n", type = "integer", minimum = 19000101L, 
    minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20190430L), state = list(name = "state", "in" = "query", description = "State FIPS code - must be two digits including leading zero  Use the list/states service for a list of state codes (e.g., https://aqs.epa.gov/data/api/list/states?email=test@aqs.api&key=test).\n", type = "string", minLength = 2L, maxLength = 2L, pattern = "^[0-9][0-9]$", "x-example" = "16")), .api_validation$body_value, c(email = "query", key = "query", param = "query", bdate = "query", edate = "query", cbdate = "query", cedate = "query", state = "query"))
  params <- base::list("email" = email, "key" = key, "param" = param, "bdate" = bdate, "edate" = edate, "cbdate" = cbdate, "cedate" = cedate, "state" = state)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  if (base::is.character(params[["param"]]) && base::any(!base::nzchar(params[["param"]]))) base::stop("Empty query parameter: param")
  if (base::is.character(params[["bdate"]]) && base::any(!base::nzchar(params[["bdate"]]))) base::stop("Empty query parameter: bdate")
  if (base::is.character(params[["edate"]]) && base::any(!base::nzchar(params[["edate"]]))) base::stop("Empty query parameter: edate")
  if (base::is.character(params[["cbdate"]]) && base::any(!base::nzchar(params[["cbdate"]]))) base::stop("Empty query parameter: cbdate")
  if (base::is.character(params[["cedate"]]) && base::any(!base::nzchar(params[["cedate"]]))) base::stop("Empty query parameter: cedate")
  if (base::is.character(params[["state"]]) && base::any(!base::nzchar(params[["state"]]))) base::stop("Empty query parameter: state")
  result <- api_request(method = "GET", path = "/qaOnePointQcRawData/byState", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]], "param" = params[["param"]], "bdate" = params[["bdate"]], "edate" = params[["edate"]], "cbdate" = params[["cbdate"]], "cedate" = params[["cedate"]], "state" = params[["state"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))), parameter_serialization = list(list(name = "param", location = "query", schema = list(name = "param", "in" = "query", description = "Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@aqs.api&key=test&pc=CRITERIA)\n", type = "array", items = list(type = "string", minLength = 5L, maxLength = 5L, pattern = "^[0-9][0-9][0-9][0-9][0-9]$"), 
    collectionFormat = "csv", "x-example" = "88101,44201"), style = "form", explode = FALSE, collection_format = "csv", required = TRUE)))
  result
}

#' Returns QA one point QC raw data by county
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @param param Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@@aqs.api&key=test&pc=CRITERIA)
#' 
#' @param bdate Begin date of data (YYYYMMDD).  For example 20100101.
#' @param edate End date of data (YYYYMMDD).  For example 20101231.
#' @param cbdate Beginning of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.
#' 
#' @param cedate End of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.
#' 
#' @param state State FIPS code - must be two digits including leading zero  Use the list/states service for a list of state codes (e.g., https://aqs.epa.gov/data/api/list/states?email=test@@aqs.api&key=test).
#' 
#' @param county County FIPS code - must be three digits including leading zeroes.
#' @return Decoded response returned by the client request helper.
#' @family qaOnePointQcRawData endpoints
#' @export
# Generated with specmill; do not edit by hand.
qa_one_point_qc_raw_data_by_county <- function(email, key, param, bdate, edate, cbdate = NULL, cedate = NULL, state, county) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  if (base::is.null(param)) base::stop("Required input: param")
  if (base::is.null(bdate)) base::stop("Required input: bdate")
  if (base::is.null(edate)) base::stop("Required input: edate")
  if (base::is.null(state)) base::stop("Required input: state")
  if (base::is.null(county)) base::stop("Required input: county")
  .api_validation$parameter_values(base::list("email" = email, "key" = key, "param" = param, "bdate" = bdate, "edate" = edate, "cbdate" = cbdate, "cedate" = cedate, "state" = state, "county" = county), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test"), param = list(name = "param", "in" = "query", description = "Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@aqs.api&key=test&pc=CRITERIA)\n", 
    type = "array", items = list(type = "string", minLength = 5L, maxLength = 5L, pattern = "^[0-9][0-9][0-9][0-9][0-9]$"), collectionFormat = "csv", "x-example" = "88101,44201"), bdate = list(name = "bdate", "in" = "query", description = "Begin date of data (YYYYMMDD).  For example 20100101.", type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180301L), edate = list(name = "edate", 
    "in" = "query", description = "End date of data (YYYYMMDD).  For example 20101231.", type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180331L), cbdate = list(name = "cbdate", "in" = "query", description = "Beginning of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.\n", 
    type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180101L), cedate = list(name = "cedate", "in" = "query", description = "End of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.\n", type = "integer", minimum = 19000101L, 
    minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20190430L), state = list(name = "state", "in" = "query", description = "State FIPS code - must be two digits including leading zero  Use the list/states service for a list of state codes (e.g., https://aqs.epa.gov/data/api/list/states?email=test@aqs.api&key=test).\n", type = "string", minLength = 2L, maxLength = 2L, pattern = "^[0-9][0-9]$", "x-example" = "16"), 
    county = list(name = "county", "in" = "query", description = "County FIPS code - must be three digits including leading zeroes.", type = "string", minLength = 3L, maxLength = 3L, pattern = "^[0-9][0-9][0-9]$", "x-example" = "001")), .api_validation$body_value, c(email = "query", key = "query", param = "query", bdate = "query", edate = "query", cbdate = "query", cedate = "query", state = "query", county = "query"))
  params <- base::list("email" = email, "key" = key, "param" = param, "bdate" = bdate, "edate" = edate, "cbdate" = cbdate, "cedate" = cedate, "state" = state, "county" = county)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  if (base::is.character(params[["param"]]) && base::any(!base::nzchar(params[["param"]]))) base::stop("Empty query parameter: param")
  if (base::is.character(params[["bdate"]]) && base::any(!base::nzchar(params[["bdate"]]))) base::stop("Empty query parameter: bdate")
  if (base::is.character(params[["edate"]]) && base::any(!base::nzchar(params[["edate"]]))) base::stop("Empty query parameter: edate")
  if (base::is.character(params[["cbdate"]]) && base::any(!base::nzchar(params[["cbdate"]]))) base::stop("Empty query parameter: cbdate")
  if (base::is.character(params[["cedate"]]) && base::any(!base::nzchar(params[["cedate"]]))) base::stop("Empty query parameter: cedate")
  if (base::is.character(params[["state"]]) && base::any(!base::nzchar(params[["state"]]))) base::stop("Empty query parameter: state")
  if (base::is.character(params[["county"]]) && base::any(!base::nzchar(params[["county"]]))) base::stop("Empty query parameter: county")
  result <- api_request(method = "GET", path = "/qaOnePointQcRawData/byCounty", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]], "param" = params[["param"]], "bdate" = params[["bdate"]], "edate" = params[["edate"]], "cbdate" = params[["cbdate"]], "cedate" = params[["cedate"]], "state" = params[["state"]], "county" = params[["county"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))), parameter_serialization = list(list(name = "param", location = "query", schema = list(name = "param", "in" = "query", description = "Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@aqs.api&key=test&pc=CRITERIA)\n", type = "array", items = list(type = "string", minLength = 5L, maxLength = 5L, pattern = "^[0-9][0-9][0-9][0-9][0-9]$"), 
    collectionFormat = "csv", "x-example" = "88101,44201"), style = "form", explode = FALSE, collection_format = "csv", required = TRUE)))
  result
}

#' Returns QA one point QC raw data by site
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @param param Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@@aqs.api&key=test&pc=CRITERIA)
#' 
#' @param bdate Begin date of data (YYYYMMDD).  For example 20100101.
#' @param edate End date of data (YYYYMMDD).  For example 20101231.
#' @param cbdate Beginning of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.
#' 
#' @param cedate End of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.
#' 
#' @param state State FIPS code - must be two digits including leading zero  Use the list/states service for a list of state codes (e.g., https://aqs.epa.gov/data/api/list/states?email=test@@aqs.api&key=test).
#' 
#' @param county County FIPS code - must be three digits including leading zeroes.
#' @param site Site number - must be four digits including leading zeroes.
#' @return Decoded response returned by the client request helper.
#' @family qaOnePointQcRawData endpoints
#' @export
# Generated with specmill; do not edit by hand.
qa_one_point_qc_raw_data_by_site <- function(email, key, param, bdate, edate, cbdate = NULL, cedate = NULL, state, county, site) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  if (base::is.null(param)) base::stop("Required input: param")
  if (base::is.null(bdate)) base::stop("Required input: bdate")
  if (base::is.null(edate)) base::stop("Required input: edate")
  if (base::is.null(state)) base::stop("Required input: state")
  if (base::is.null(county)) base::stop("Required input: county")
  if (base::is.null(site)) base::stop("Required input: site")
  .api_validation$parameter_values(base::list("email" = email, "key" = key, "param" = param, "bdate" = bdate, "edate" = edate, "cbdate" = cbdate, "cedate" = cedate, "state" = state, "county" = county, "site" = site), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test"), param = list(name = "param", "in" = "query", description = "Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@aqs.api&key=test&pc=CRITERIA)\n", 
    type = "array", items = list(type = "string", minLength = 5L, maxLength = 5L, pattern = "^[0-9][0-9][0-9][0-9][0-9]$"), collectionFormat = "csv", "x-example" = "88101,44201"), bdate = list(name = "bdate", "in" = "query", description = "Begin date of data (YYYYMMDD).  For example 20100101.", type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180301L), edate = list(name = "edate", 
    "in" = "query", description = "End date of data (YYYYMMDD).  For example 20101231.", type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180331L), cbdate = list(name = "cbdate", "in" = "query", description = "Beginning of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.\n", 
    type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180101L), cedate = list(name = "cedate", "in" = "query", description = "End of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.\n", type = "integer", minimum = 19000101L, 
    minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20190430L), state = list(name = "state", "in" = "query", description = "State FIPS code - must be two digits including leading zero  Use the list/states service for a list of state codes (e.g., https://aqs.epa.gov/data/api/list/states?email=test@aqs.api&key=test).\n", type = "string", minLength = 2L, maxLength = 2L, pattern = "^[0-9][0-9]$", "x-example" = "16"), 
    county = list(name = "county", "in" = "query", description = "County FIPS code - must be three digits including leading zeroes.", type = "string", minLength = 3L, maxLength = 3L, pattern = "^[0-9][0-9][0-9]$", "x-example" = "001"), site = list(name = "site", "in" = "query", description = "Site number - must be four digits including leading zeroes.", type = "string", minLength = 4L, maxLength = 4L, pattern = "^[0-9][0-9][0-9][0-9]$", "x-example" = "0010")), .api_validation$body_value, c(email = "query", key = "query", param = "query", bdate = "query", edate = "query", cbdate = "query", cedate = "query", state = "query", county = "query", site = "query"))
  params <- base::list("email" = email, "key" = key, "param" = param, "bdate" = bdate, "edate" = edate, "cbdate" = cbdate, "cedate" = cedate, "state" = state, "county" = county, "site" = site)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  if (base::is.character(params[["param"]]) && base::any(!base::nzchar(params[["param"]]))) base::stop("Empty query parameter: param")
  if (base::is.character(params[["bdate"]]) && base::any(!base::nzchar(params[["bdate"]]))) base::stop("Empty query parameter: bdate")
  if (base::is.character(params[["edate"]]) && base::any(!base::nzchar(params[["edate"]]))) base::stop("Empty query parameter: edate")
  if (base::is.character(params[["cbdate"]]) && base::any(!base::nzchar(params[["cbdate"]]))) base::stop("Empty query parameter: cbdate")
  if (base::is.character(params[["cedate"]]) && base::any(!base::nzchar(params[["cedate"]]))) base::stop("Empty query parameter: cedate")
  if (base::is.character(params[["state"]]) && base::any(!base::nzchar(params[["state"]]))) base::stop("Empty query parameter: state")
  if (base::is.character(params[["county"]]) && base::any(!base::nzchar(params[["county"]]))) base::stop("Empty query parameter: county")
  if (base::is.character(params[["site"]]) && base::any(!base::nzchar(params[["site"]]))) base::stop("Empty query parameter: site")
  result <- api_request(method = "GET", path = "/qaOnePointQcRawData/bySite", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]], "param" = params[["param"]], "bdate" = params[["bdate"]], "edate" = params[["edate"]], "cbdate" = params[["cbdate"]], "cedate" = params[["cedate"]], "state" = params[["state"]], "county" = params[["county"]], "site" = params[["site"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))), parameter_serialization = list(list(name = "param", location = "query", schema = list(name = "param", "in" = "query", description = "Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@aqs.api&key=test&pc=CRITERIA)\n", type = "array", items = list(type = "string", minLength = 5L, maxLength = 5L, pattern = "^[0-9][0-9][0-9][0-9][0-9]$"), 
    collectionFormat = "csv", "x-example" = "88101,44201"), style = "form", explode = FALSE, collection_format = "csv", required = TRUE)))
  result
}

#' Returns QA one point QC raw data by primary quality assurance organization code
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @param param Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@@aqs.api&key=test&pc=CRITERIA)
#' 
#' @param bdate Begin date of data (YYYYMMDD).  For example 20100101.
#' @param edate End date of data (YYYYMMDD).  For example 20101231.
#' @param cbdate Beginning of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.
#' 
#' @param cedate End of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.
#' 
#' @param pqao Code for the primary quality assurance organization - up to 4 digits
#' @return Decoded response returned by the client request helper.
#' @family qaOnePointQcRawData endpoints
#' @export
# Generated with specmill; do not edit by hand.
qa_one_point_qc_raw_data_by_pqao <- function(email, key, param, bdate, edate, cbdate = NULL, cedate = NULL, pqao) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  if (base::is.null(param)) base::stop("Required input: param")
  if (base::is.null(bdate)) base::stop("Required input: bdate")
  if (base::is.null(edate)) base::stop("Required input: edate")
  if (base::is.null(pqao)) base::stop("Required input: pqao")
  .api_validation$parameter_values(base::list("email" = email, "key" = key, "param" = param, "bdate" = bdate, "edate" = edate, "cbdate" = cbdate, "cedate" = cedate, "pqao" = pqao), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test"), param = list(name = "param", "in" = "query", description = "Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@aqs.api&key=test&pc=CRITERIA)\n", 
    type = "array", items = list(type = "string", minLength = 5L, maxLength = 5L, pattern = "^[0-9][0-9][0-9][0-9][0-9]$"), collectionFormat = "csv", "x-example" = "88101,44201"), bdate = list(name = "bdate", "in" = "query", description = "Begin date of data (YYYYMMDD).  For example 20100101.", type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180301L), edate = list(name = "edate", 
    "in" = "query", description = "End date of data (YYYYMMDD).  For example 20101231.", type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180331L), cbdate = list(name = "cbdate", "in" = "query", description = "Beginning of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.\n", 
    type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180101L), cedate = list(name = "cedate", "in" = "query", description = "End of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.\n", type = "integer", minimum = 19000101L, 
    minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20190430L), pqao = list(name = "pqao", "in" = "query", description = "Code for the primary quality assurance organization - up to 4 digits", type = "string", "x-example" = "0511")), .api_validation$body_value, c(email = "query", key = "query", param = "query", bdate = "query", edate = "query", cbdate = "query", cedate = "query", pqao = "query"))
  params <- base::list("email" = email, "key" = key, "param" = param, "bdate" = bdate, "edate" = edate, "cbdate" = cbdate, "cedate" = cedate, "pqao" = pqao)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  if (base::is.character(params[["param"]]) && base::any(!base::nzchar(params[["param"]]))) base::stop("Empty query parameter: param")
  if (base::is.character(params[["bdate"]]) && base::any(!base::nzchar(params[["bdate"]]))) base::stop("Empty query parameter: bdate")
  if (base::is.character(params[["edate"]]) && base::any(!base::nzchar(params[["edate"]]))) base::stop("Empty query parameter: edate")
  if (base::is.character(params[["cbdate"]]) && base::any(!base::nzchar(params[["cbdate"]]))) base::stop("Empty query parameter: cbdate")
  if (base::is.character(params[["cedate"]]) && base::any(!base::nzchar(params[["cedate"]]))) base::stop("Empty query parameter: cedate")
  if (base::is.character(params[["pqao"]]) && base::any(!base::nzchar(params[["pqao"]]))) base::stop("Empty query parameter: pqao")
  result <- api_request(method = "GET", path = "/qaOnePointQcRawData/byPQAO", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]], "param" = params[["param"]], "bdate" = params[["bdate"]], "edate" = params[["edate"]], "cbdate" = params[["cbdate"]], "cedate" = params[["cedate"]], "pqao" = params[["pqao"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))), parameter_serialization = list(list(name = "param", location = "query", schema = list(name = "param", "in" = "query", description = "Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@aqs.api&key=test&pc=CRITERIA)\n", type = "array", items = list(type = "string", minLength = 5L, maxLength = 5L, pattern = "^[0-9][0-9][0-9][0-9][0-9]$"), 
    collectionFormat = "csv", "x-example" = "88101,44201"), style = "form", explode = FALSE, collection_format = "csv", required = TRUE)))
  result
}

#' Returns QA one point QC raw data by monitoring agency code
#' 
#' @noMd
#' @param email User ID (email address)
#' @param key Key
#' @param param Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@@aqs.api&key=test&pc=CRITERIA)
#' 
#' @param bdate Begin date of data (YYYYMMDD).  For example 20100101.
#' @param edate End date of data (YYYYMMDD).  For example 20101231.
#' @param cbdate Beginning of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.
#' 
#' @param cedate End of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.
#' 
#' @param agency Code for the monitoring agency - up to 4 digits
#' @return Decoded response returned by the client request helper.
#' @family qaOnePointQcRawData endpoints
#' @export
# Generated with specmill; do not edit by hand.
qa_one_point_qc_raw_data_by_ma <- function(email, key, param, bdate, edate, cbdate = NULL, cedate = NULL, agency) {
  if (base::is.null(email)) base::stop("Required input: email")
  if (base::is.null(key)) base::stop("Required input: key")
  if (base::is.null(param)) base::stop("Required input: param")
  if (base::is.null(bdate)) base::stop("Required input: bdate")
  if (base::is.null(edate)) base::stop("Required input: edate")
  if (base::is.null(agency)) base::stop("Required input: agency")
  .api_validation$parameter_values(base::list("email" = email, "key" = key, "param" = param, "bdate" = bdate, "edate" = edate, "cbdate" = cbdate, "cedate" = cedate, "agency" = agency), list(email = list(name = "email", "in" = "query", description = "User ID (email address)", type = "string", "x-example" = "test@aqs.api"), key = list(name = "key", "in" = "query", description = "Key", type = "string", "x-example" = "test"), param = list(name = "param", "in" = "query", description = "Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@aqs.api&key=test&pc=CRITERIA)\n", 
    type = "array", items = list(type = "string", minLength = 5L, maxLength = 5L, pattern = "^[0-9][0-9][0-9][0-9][0-9]$"), collectionFormat = "csv", "x-example" = "88101,44201"), bdate = list(name = "bdate", "in" = "query", description = "Begin date of data (YYYYMMDD).  For example 20100101.", type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180301L), edate = list(name = "edate", 
    "in" = "query", description = "End date of data (YYYYMMDD).  For example 20101231.", type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180331L), cbdate = list(name = "cbdate", "in" = "query", description = "Beginning of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.\n", 
    type = "integer", minimum = 19000101L, minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20180101L), cedate = list(name = "cedate", "in" = "query", description = "End of window to look for changed data (YYYYMMDD).  For example,  to get data for 2010 that last changed in March of 2011, use these parameters. bdate = 20100101, edate = 20101231, cbdate = 20110301, cedate = 20110331.\n", type = "integer", minimum = 19000101L, 
    minLength = 8L, maximum = 21991231L, maxLength = 8L, pattern = "^(19|20|21)[0-9]{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])$", "x-example" = 20190430L), agency = list(name = "agency", "in" = "query", description = "Code for the monitoring agency - up to 4 digits", type = "string", "x-example" = "0511")), .api_validation$body_value, c(email = "query", key = "query", param = "query", bdate = "query", edate = "query", cbdate = "query", cedate = "query", agency = "query"))
  params <- base::list("email" = email, "key" = key, "param" = param, "bdate" = bdate, "edate" = edate, "cbdate" = cbdate, "cedate" = cedate, "agency" = agency)
  if (base::is.character(params[["email"]]) && base::any(!base::nzchar(params[["email"]]))) base::stop("Empty query parameter: email")
  if (base::is.character(params[["key"]]) && base::any(!base::nzchar(params[["key"]]))) base::stop("Empty query parameter: key")
  if (base::is.character(params[["param"]]) && base::any(!base::nzchar(params[["param"]]))) base::stop("Empty query parameter: param")
  if (base::is.character(params[["bdate"]]) && base::any(!base::nzchar(params[["bdate"]]))) base::stop("Empty query parameter: bdate")
  if (base::is.character(params[["edate"]]) && base::any(!base::nzchar(params[["edate"]]))) base::stop("Empty query parameter: edate")
  if (base::is.character(params[["cbdate"]]) && base::any(!base::nzchar(params[["cbdate"]]))) base::stop("Empty query parameter: cbdate")
  if (base::is.character(params[["cedate"]]) && base::any(!base::nzchar(params[["cedate"]]))) base::stop("Empty query parameter: cedate")
  if (base::is.character(params[["agency"]]) && base::any(!base::nzchar(params[["agency"]]))) base::stop("Empty query parameter: agency")
  result <- api_request(method = "GET", path = "/qaOnePointQcRawData/byMA", path_params = base::list(), query = base::list("email" = params[["email"]], "key" = params[["key"]], "param" = params[["param"]], "bdate" = params[["bdate"]], "edate" = params[["edate"]], "cbdate" = params[["cbdate"]], "cedate" = params[["cedate"]], "agency" = params[["agency"]]), body = NULL, request_controls = list(timeout = 30L, max_retries = 0L, retry_writes = FALSE), server = list(url = "https://aqs.epa.gov/data/api"), auth = list(list(list(scheme = "aqs_api_auth", type = "apiKey", location = "query", name = "key", envvar = "AQSCLIENT_AQS_API_AUTH"))), parameter_serialization = list(list(name = "param", location = "query", schema = list(name = "param", "in" = "query", description = "Parameter code.  Enter a 5-digit AQS parameter code  (or multiple codes separated by commas).  Example 44201,88101,88502. Use the list/parametersByClass service for valid parameter codes. (e.g., https://aqs.epa.gov/data/api/list/parametersByClass?email=test@aqs.api&key=test&pc=CRITERIA)\n", type = "array", items = list(type = "string", minLength = 5L, maxLength = 5L, pattern = "^[0-9][0-9][0-9][0-9][0-9]$"), 
    collectionFormat = "csv", "x-example" = "88101,44201"), style = "form", explode = FALSE, collection_format = "csv", required = TRUE)))
  result
}
