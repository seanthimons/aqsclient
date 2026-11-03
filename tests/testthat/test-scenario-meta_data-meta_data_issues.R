# Generated with specmill; do not edit by hand.
# Cassette scenario test; replays a reviewed recording.
testthat::test_that('meta_data_issues replays GET /metaData/issues through meta_data_issues', {
  replay_cassette('meta_data', 'meta_data_issues', c('method', 'uri'), provenance = c('schema' = '5c99704912433212', 'policy' = 'dabec31784eb4f6b', 'helper' = 'b65f03ca80f7681e', 'hooks' = '150ef9886878b561', 'expectation' = 'e47333b79152455f'))
  result <- aqsclient::meta_data_issues()
  replay_expect_signature(result, 'meta_data', 'meta_data_issues')
})
