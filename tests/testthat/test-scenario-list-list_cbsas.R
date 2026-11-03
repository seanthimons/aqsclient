# Generated with specmill; do not edit by hand.
# Cassette scenario test; replays a reviewed recording.
testthat::test_that('list_cbsas replays GET /list/cbsas through list_cbsas', {
  replay_cassette('list', 'list_cbsas', c('method', 'uri'), provenance = c('schema' = '32dab673c38ebad5', 'policy' = 'cc8454fff9c03302', 'helper' = 'b65f03ca80f7681e', 'hooks' = '150ef9886878b561', 'expectation' = 'f79d5428459a6f31'))
  result <- aqsclient::list_cbsas()
  replay_expect_signature(result, 'list', 'list_cbsas')
})
