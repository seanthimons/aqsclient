# What the AQS trial teaches us

The parser fix is committed and pushed as `aa456bf`. The items below distinguish
confirmed defects from proposed improvements. The live evidence is in
[audit/README.md](audit/README.md).

| Priority | Area | Evidence | Improvement |
|---|---|---|---|
| Done | Parser | R partially matched missing `security` to Swagger `securityDefinitions`. | Exact field lookups in parsing, configuration discovery, and schema reporting. Regression covers absent root security, inheritance, explicit public overrides, and generated query authentication. |
| High | Setup diagnostics | Two paths share one operationId. A direct `read_operations()` call stops before the user can inspect them. | Name the colliding IDs and routes in the error and show a `policy$names` example. Offer path-based name suggestions for review during configuration. Tracked in [issue 43](https://github.com/seanthimons/specmill/issues/43). |
| High | Documentation | Initialization can emit configuration with naming diagnostics; parsing and generation may stop on unresolved collisions. | Explain `read_operations()` vs `initialize_client()` vs `generate_client()`, and document the recovery sequence with a duplicate-ID example. |
| High | Configuration docs | Four transaction endpoints reject a default that the schema declares. `units = NULL` makes them work. | Document how to exclude an obsolete parameter with reviewed YAML while preserving the original schema. Include an AQS example and a request test proving the parameter is absent. |
| High | Live validation | The schema includes a route that returns 422 and a health route whose body is not JSON. | Make clear that successful generation and offline tests do not prove live compatibility. Recommend bounded read-only smoke checks and classify HTTP errors, application statuses, valid empty results, and response-media differences separately. |
| Medium | HTTP diagnostics | Safe helper errors report status/media but omit the API's useful `found unpermitted variable: units` message. | Consider an opt-in diagnostic path that returns explicitly selected, redacted error fields. Preserve current credential-safe defaults; AQS echoes credential-bearing URLs in response headers. |
| Medium | Credential interface | AQS declares the same key as a query input and security scheme, requiring callers to supply it twice. | Review how to choose one credential source or reject mismatched values. The audit tested matching keys; mismatch behavior was not tested and is not claimed as a confirmed defect. |
| Medium | Reproducibility | Both the earlier release and patched local source report version 0.1.4. | Record the generator commit alongside the schema checksum and configuration. Version alone is insufficient to reproduce this client. |

## Parser boundaries worth keeping

Do not silently rename public functions, remove parameters based on one remote
error, guess replacement routes, or decode every raw response as JSON. Those
changes can conceal upstream defects or change a public contract. Use explicit
configuration for API-specific repairs, and reserve parser changes for incorrect
interpretation of the schema, as with partial field matching.

At schema-reading boundaries, prefer exact `[[...]]` lookup for optional fields.
Audit other `$` accesses where a missing name could match a longer field, but
pair any changes with a fixture demonstrating the problem. Do not blindly
rewrite all field access across the package.

## Useful documentation additions

1. A troubleshooting section that starts with a duplicate operationId and shows
   `read_operations(schema, policy = list(names = ...))`, then the equivalent
   service YAML. Explain that initialization writes proposals and diagnostics,
   while generation requires those proposals to be resolved.
2. A service-drift example showing schema preservation, request inspection, a
   reviewed parameter exclusion, regeneration, and one live confirmation.
3. A transport section explaining that decoding follows actual Content-Type,
   and that a 200 response can still be an application error or malformed output.
4. A short handoff checklist: generated package source, schema checksum, generator
   commit, configuration, ownership manifest, offline test, and credential-free
   audit evidence. Keep live tests opt-in and account-mutating endpoints excluded.

## What does not need more machinery

The existing authentication scaffolding, generated HTTP helper, parameter
exclusion policy, and endpoint selection policy already cover the useful AQS
repairs. A new authentication system or generic response-sniffing fallback is
not justified by this trial. Better diagnostics and worked documentation examples
would remove most of the friction encountered here.
