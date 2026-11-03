# Generated with specmill; do not edit by hand.
# Cassette scenario test; replays a reviewed recording.
testthat::test_that('service_available replays GET /serviceAvailable through service_available', {
  replay_cassette('available', 'service_available', c('method', 'uri'), provenance = c('schema' = '41e1800350978b5a', 'policy' = '2cec160878464d19', 'helper' = 'b65f03ca80f7681e', 'hooks' = '150ef9886878b561', 'expectation' = 'bf8f2327f85171af'))
  result <- aqsclient::service_available()
  replay_expect_signature(result, 'available', 'service_available')
})
