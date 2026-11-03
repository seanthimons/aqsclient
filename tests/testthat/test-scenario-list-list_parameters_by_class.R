# Generated with specmill; do not edit by hand.
# Cassette scenario test; replays a reviewed recording.
testthat::test_that('list_parameters_by_class replays GET /list/parametersByClass through list_parameters_by_class', {
  replay_cassette('list', 'list_parameters_by_class', c('method', 'uri'), provenance = c('schema' = '0c25501650512f84', 'policy' = '1f78cef1969fc57d', 'helper' = 'b65f03ca80f7681e', 'hooks' = '150ef9886878b561', 'expectation' = 'cb759b6d8d19b741'))
  result <- aqsclient::list_parameters_by_class(pc = "ALL")
  replay_expect_signature(result, 'list', 'list_parameters_by_class')
})
