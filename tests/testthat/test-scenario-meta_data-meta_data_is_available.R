# Generated with specmill; do not edit by hand.
# Cassette scenario test; replays a reviewed recording.
testthat::test_that('meta_data_is_available replays GET /metaData/isAvailable through meta_data_is_available', {
  replay_cassette('meta_data', 'meta_data_is_available', c('method', 'uri'), provenance = c('schema' = '8a184ffb578c308d', 'policy' = 'a4914516c50bbdcc', 'helper' = 'b65f03ca80f7681e', 'hooks' = '150ef9886878b561', 'expectation' = 'dd2c028ab04aaa97'))
  result <- aqsclient::meta_data_is_available()
  replay_expect_signature(result, 'meta_data', 'meta_data_is_available')
})
