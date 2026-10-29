# AQS live endpoint audit

Completed 2026-09-23T21:03:31.797055+00:00 using specmill commit `aa456bf` and the original EPA schema. The security fix was committed and pushed to `seanthimons/specmill` main. No further generator changes were needed during this audit.

All 78 read-only endpoints were attempted through the generated R wrappers. `/signup` was deliberately skipped because it creates an account or resets the key and sends email.

## Results

| Final result across baseline and follow-up queries | Endpoints |
|---|---:|
| Returned data | 64 |
| Accepted request, no matching data | 11 |
| Healthy metadata status | 1 |
| Unexpected response format | 1 |
| Service unavailable at schema route | 1 |
| Skipped account mutation | 1 |

Baseline defaults worked on 72 endpoints: 48 returned data, 23 returned no matches, and one returned a healthy status. Four additional routes work after suppressing an obsolete schema default. These are live smoke checks, not exhaustive validation of every input combination or response field. Empty results establish request acceptance but do not exercise populated response decoding.

## Adjustments supported by live evidence

### Remove the unsupported transactionsSample units parameter

`/transactionsSample/byState`, `/byCounty`, `/bySite`, and `/byMA` return HTTP 400 with `found unpermitted variable: units` using the generated default. The schema declares `units` with default `standard`; specmill faithfully emits it.

Explicit `units = NULL` removes the parameter and succeeds: state returned 51 records, agency returned 3, and county/site returned valid empty results. This is schema/service drift, not a query-encoding or authentication failure.

Immediate workaround:

```r
transactions_sample_by_state(
  email = Sys.getenv('AQS_EMAIL'), key = Sys.getenv('AQS_KEY'),
  param = '88101', bdate = 20180301L, edate = 20180301L,
  state = '16', units = NULL
)
```

For a maintained client, a reviewed parameter exclusion in `apis/transactions_sample.yml` can remove `units` from all wrappers in that service. Merge this into the existing defaults, preserving its file and documentation settings:

```yaml
defaults:
  parameters:
    query units:
      exclude: true
```

Regenerate and verify the resulting requests. This policy change is recommended, not applied by the audit; the original schema and generated defaults are retained for reproducibility.

### Disable or investigate transactionsSample/byPOC

The schema advertises this route, but the live API returns HTTP 422 and `No matching service was found, please check spelling and case.` Removing `units` does not fix it. EPA's service guide does not list it among sample-transaction filters. Exclude it from the client selection until EPA confirms a supported route; no replacement URL was guessed.

### Prefer metaData/isAvailable for health checks

`/serviceAvailable` returns HTTP 200 without a Content-Type header. Its body contains a serialized HTTP response and a `Ready @` message. The generated helper correctly returns raw bytes for an untyped response. The schema's JSON declaration does not match the wire response. `/metaData/isAvailable` returns a usable healthy status; use that endpoint instead of adding a general JSON fallback to specmill.

### Empty results need suitable dates and parameters

Changing PM2.5 sample/daily queries from March 1 to March 3, 2018 produced data for all eight county/site/CBSA/box routes. Switching one-point QC from PM2.5 to ozone produced records for all five filters. EPA's Alabama 2017 ozone example returned 79 annual-performance records. No client changes were required.

The duplicate annual-performance operation IDs remain resolved through explicit method/path names in service YAML. Both distinct routes were exercised. The untouched EPA schema now works with the exact-security-lookup fix.

## Method and evidence

Requests were sequential, with a 6.2-second pause after every request, a 30-second timeout, and retries disabled, following [EPA's limits and service documentation](https://aqs.epa.gov/aqsweb/documents/data_api.html). Defaults used a one-day March 2018 window in Idaho; QA queries used March 2018. Inputs for every baseline and positive-control query are recorded without email or key. Credentials and response URLs were not saved.

- `results.csv`: baseline outcome, public inputs, elapsed time, and safe error messages for all 79 schema routes.
- `diagnostics.csv`: HTTP status, Content-Type, and redacted diagnostic content for anomalous routes.
- `positive-controls.csv`: changed-date and changed-parameter follow-ups.
- `transaction-workaround.csv`: results with `units = NULL`.
- `summary.csv`: one final classification per route.
- `provenance.json`: schema source, checksum, and generator revision.
- `run.R`, `diagnose.R`, `positive-controls.R`, `transaction-workaround.R`: reproducible scripts, run from the client root. Run them sequentially. `run.R` resumes from its existing CSV; use a new output location or archive the old results before a fresh sweep.

Raw HTTP response content was inspected only for anomaly diagnosis. No bulk observation payloads were archived. The authentication helpers, regression test, generation check, and offline request tests also passed before this sweep.

## Endpoint results

| Endpoint | Final outcome | Rows | Notes |
|---|---|---:|---|
| `/list/states` | success | 56 |  |
| `/list/countiesByState` | success | 44 |  |
| `/list/sitesByCounty` | success | 29 |  |
| `/list/cbsas` | success | 1006 |  |
| `/list/classes` | success | 27 |  |
| `/list/parametersByClass` | success | 8 |  |
| `/list/mas` | success | 382 |  |
| `/metaData/fieldsByService` | success | 27 |  |
| `/metaData/isAvailable` | healthy | 0 | Health message; no data array expected. |
| `/list/pqaos` | success | 773 |  |
| `/metaData/revisionHistory` | success | 22 |  |
| `/metaData/issues` | success | 1 |  |
| `/serviceAvailable` | unexpected_response |  | HTTP 200, missing Content-Type; body embeds HTTP headers and Ready @. Use metaData/isAvailable. |
| `/sampleData/byState` | success | 51 |  |
| `/sampleData/byCounty` | success | 2 | Try March 3 instead of March 1 for PM2.5. |
| `/sampleData/bySite` | success | 2 | Try March 3 instead of March 1 for PM2.5. |
| `/sampleData/byCBSA` | success | 3 | Try March 3 instead of March 1 for PM2.5. |
| `/sampleData/byBox` | success | 2 | Try March 3 instead of March 1 for PM2.5. |
| `/dailyData/byState` | success | 34 |  |
| `/dailyData/byCounty` | success | 8 | Try March 3 instead of March 1 for PM2.5. |
| `/dailyData/bySite` | success | 8 | Try March 3 instead of March 1 for PM2.5. |
| `/dailyData/byCBSA` | success | 8 | Try March 3 instead of March 1 for PM2.5. |
| `/dailyData/byBox` | success | 8 | Try March 3 instead of March 1 for PM2.5. |
| `/annualData/byState` | success | 202 |  |
| `/annualData/byCounty` | success | 48 |  |
| `/annualData/bySite` | success | 48 |  |
| `/annualData/byCBSA` | success | 72 |  |
| `/annualData/byBox` | success | 48 |  |
| `/qaAnnualPerformanceEvaluations/bySite` | no_data | 0 |  |
| `/qaAnnualPerformanceEvaluations/byCounty` | no_data | 0 |  |
| `/qaAnnualPerformanceEvaluations/byState` | success | 79 | Use EPA documented Alabama 2017 ozone example. |
| `/qaAnnualPerformanceEvaluations/byPQAO` | no_data | 0 |  |
| `/qaAnnualPerformanceEvaluations/byMA` | no_data | 0 |  |
| `/qaCollocatedAssessments/byState` | success | 9 |  |
| `/qaCollocatedAssessments/byCounty` | success | 4 |  |
| `/qaCollocatedAssessments/bySite` | success | 4 |  |
| `/qaCollocatedAssessments/byPQAO` | success | 4 |  |
| `/qaCollocatedAssessments/byMA` | success | 4 |  |
| `/qaPepAudits/byState` | success | 2 |  |
| `/qaPepAudits/byCounty` | success | 1 |  |
| `/qaPepAudits/bySite` | success | 1 |  |
| `/qaPepAudits/byPQAO` | success | 2 |  |
| `/qaPepAudits/byMA` | success | 2 |  |
| `/qaFlowRateAudits/byState` | success | 3 |  |
| `/qaFlowRateAudits/byCounty` | success | 2 |  |
| `/qaFlowRateAudits/bySite` | success | 2 |  |
| `/qaFlowRateAudits/byPQAO` | success | 3 |  |
| `/qaFlowRateAudits/byMA` | success | 3 |  |
| `/qaFlowRateVerifications/byState` | success | 12 |  |
| `/qaFlowRateVerifications/byCounty` | success | 3 |  |
| `/qaFlowRateVerifications/bySite` | success | 3 |  |
| `/qaFlowRateVerifications/byPQAO` | success | 9 |  |
| `/qaFlowRateVerifications/byMA` | success | 9 |  |
| `/qaBlanks/byState` | success | 16 |  |
| `/qaBlanks/byCounty` | success | 2 |  |
| `/qaBlanks/bySite` | success | 2 |  |
| `/qaBlanks/byPQAO` | success | 15 |  |
| `/qaBlanks/byMA` | success | 15 |  |
| `/qaOnePointQcRawData/byState` | success | 65 | Use ozone for gas-analyzer one-point QC instead of PM2.5. |
| `/qaOnePointQcRawData/byCounty` | success | 3 | Use ozone for gas-analyzer one-point QC instead of PM2.5. |
| `/qaOnePointQcRawData/bySite` | success | 3 | Use ozone for gas-analyzer one-point QC instead of PM2.5. |
| `/qaOnePointQcRawData/byPQAO` | success | 3 | Use ozone for gas-analyzer one-point QC instead of PM2.5. |
| `/qaOnePointQcRawData/byMA` | success | 3 | Use ozone for gas-analyzer one-point QC instead of PM2.5. |
| `/transactionsSample/byState` | success | 51 | Requires units = NULL; schema default is rejected. |
| `/transactionsSample/byCounty` | no_data | 0 | Requires units = NULL; schema default is rejected. |
| `/transactionsSample/bySite` | no_data | 0 | Requires units = NULL; schema default is rejected. |
| `/transactionsSample/byPOC` | unavailable |  | Requires units = NULL; schema default is rejected. |
| `/transactionsSample/byMA` | success | 3 | Requires units = NULL; schema default is rejected. |
| `/transactionsQaAnnualPerformanceEvaluations/bySite` | no_data | 0 |  |
| `/transactionsQaAnnualPerformanceEvaluations/byCounty` | no_data | 0 |  |
| `/transactionsQaAnnualPerformanceEvaluations/byState` | no_data | 0 |  |
| `/transactionsQaAnnualPerformanceEvaluations/byPQAO` | no_data | 0 |  |
| `/transactionsQaAnnualPerformanceEvaluations/byMA` | no_data | 0 |  |
| `/monitors/byState` | success | 10 |  |
| `/monitors/byCounty` | success | 2 |  |
| `/monitors/bySite` | success | 2 |  |
| `/monitors/byCBSA` | success | 3 |  |
| `/monitors/byBox` | success | 2 |  |
| `/signup` | skipped_side_effect |  | Skipped: creates account or resets key and sends email. |
