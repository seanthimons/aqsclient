# Generated with specmill; do not edit by hand.
# Cassette scenario test; replays a reviewed recording.
testthat::test_that('list_counties_by_state replays GET /list/countiesByState through list_counties_by_state', {
  replay_cassette('list', 'list_counties_by_state', c('method', 'uri'), provenance = c('schema' = 'e53eff1ab62a1448', 'policy' = '5ff09e6a1e54a79d', 'helper' = 'b65f03ca80f7681e', 'hooks' = '150ef9886878b561', 'expectation' = 'bd7f0d7c373934da'))
  result <- aqsclient::list_counties_by_state(state = "16")
  replay_expect_signature(result, 'list', 'list_counties_by_state')
})
