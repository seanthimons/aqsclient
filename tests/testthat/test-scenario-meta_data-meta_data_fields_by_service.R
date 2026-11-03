# Generated with specmill; do not edit by hand.
# Cassette scenario test; replays a reviewed recording.
testthat::test_that('meta_data_fields_by_service replays GET /metaData/fieldsByService through meta_data_fields_by_service', {
  replay_cassette('meta_data', 'meta_data_fields_by_service', c('method', 'uri'), provenance = c('schema' = '8f88f93b7e937f45', 'policy' = 'a98c381655adaabf', 'helper' = 'b65f03ca80f7681e', 'hooks' = '150ef9886878b561', 'expectation' = 'b1b5406c65436d34'))
  result <- aqsclient::meta_data_fields_by_service(service = "sampleData")
  replay_expect_signature(result, 'meta_data', 'meta_data_fields_by_service')
})
