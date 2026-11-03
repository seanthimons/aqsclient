# Generated with specmill; do not edit by hand.
# Cassette scenario test; replays a reviewed recording.
testthat::test_that('list_sites_by_county replays GET /list/sitesByCounty through list_sites_by_county', {
  replay_cassette('list', 'list_sites_by_county', c('method', 'uri'), provenance = c('schema' = 'b33d81bf3327c51a', 'policy' = '36e52dc443e52972', 'helper' = 'b65f03ca80f7681e', 'hooks' = '150ef9886878b561', 'expectation' = '4074238ed0048719'))
  result <- aqsclient::list_sites_by_county(state = "16", county = "001")
  replay_expect_signature(result, 'list', 'list_sites_by_county')
})
