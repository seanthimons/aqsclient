library(aqsclient)
Sys.setenv(AQSCLIENT_DRY_RUN = 'true')
set_api_token('offline-key')
stopifnot(identical(service_available()$url, 'https://aqs.epa.gov/data/api/serviceAvailable'))
request <- list_states(email = 'offline@example.org', key = 'offline-key')
stopifnot(grepl('/list/states?', request$url, fixed = TRUE),
          grepl('email=offline%40example.org', request$url, fixed = TRUE),
          lengths(regmatches(request$url, gregexpr('key=', request$url, fixed = TRUE))) == 1L)
args <- list(email = 'offline@example.org', key = 'offline-key',
             param = c('44201', '88101'), bdate = 20240101L, edate = 20240131L)
site <- do.call(qa_annual_performance_evaluations_by_site,
                c(args, list(state = '01', county = '001', site = '0001')))
pqao <- do.call(qa_annual_performance_evaluations_by_pqao,
                c(args, list(pqao = '001')))
stopifnot(grepl('/qaAnnualPerformanceEvaluations/bySite?', site$url, fixed = TRUE),
          grepl('/qaAnnualPerformanceEvaluations/byPQAO?', pqao$url, fixed = TRUE),
          grepl('param=44201,88101', site$url, fixed = TRUE))
