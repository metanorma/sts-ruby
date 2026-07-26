# D.09: Test coverage gaps

**Status**: ongoing. Original doc: `TODO.sts-refactor/10-test-coverage.md`.
**Estimated effort**: medium, distributed across future PRs.

## Current state

- **2563 examples, 0 failures**
- Anti-pattern enforcement: 9 per-file checks in `spec/anti_patterns_spec.rb`
- Per-model attribute-set assertions: ~50 models covered (mostly IsoSts
  recent additions)
- Round-trip coverage: `spec/round_trip/reference_docs_spec.rb` exercises
  real fixtures
- Coverage: 99.8% line coverage (per TODO.sts-refactor/10)

## Gaps

### 1. Schema-validation tests

Currently absent. Each model is asserted against an attribute set in
specs, but no test validates model output against the actual XSDs in
`reference-docs/`. A schema-validation spec would catch:

- Attributes the model invents (not in XSD)
- Required attributes the model drops
- Element nesting the XSD forbids

Implementation: `Nokogiri::XML::Schema` to validate serialized output
against `reference-docs/isosts-v1/xsd/ISOSTS.xsd` and
`reference-docs/NISO-STS-extended-1-MathML3-XSD/`.

### 2. Performance tests

Currently absent. The user's TODO.sts-refactor/10 lists these as
"needed". sts-ruby parses real ISO documents (some 1MB+); parsing time
and memory pressure should be tracked.

Implementation: `rspec-benchmark` or similar. Bench against the largest
fixture (`spec/fixtures/mn-samples-iso-private/`). Track regressions
across releases.

### 3. Concurrent-parse tests

`Lutaml::Model::TransformationRegistry` uses mutexes for thread safety
(lib/lutaml/model/transformation_registry.rb:92-101). No spec covers
concurrent parsing. Worth a thread-spawning test that hammers the
registry from multiple threads to catch any race.

### 4. Versioning tests (blocked on C.08)

Once Register versioning exists, add specs that the same document parses
differently under different versions, and that version-incompatible
elements are rejected.

### 5. Cross-namespace round-trip

`spec/iso_sts/iso_sts_element_spec.rb` and `spec/sts_spec.rb` cover
IsoSts and NisoSts separately. No spec exercises a TBX-in-ISOSTS document
end-to-end (TBX elements inside IsoSts Standard with MathML 2 content).
A round-trip test for `spec/fixtures/tbx-nisosts-0.2.xml`-style documents
across all three namespaces would catch integration regressions.

### 6. Profile validation (existing)

`spec/profiles/iso_iec_validator_spec.rb` — 11 specs. Covers structural,
metadata, originator, doc-type validation. Looks healthy.

## How to apply

- Add schema-validation spec first (highest value, mechanical to write)
- Add performance spec next (gives a baseline before C.05/C.08 land)
- Concurrent-parse spec is small and high-value — fit it in alongside any
  future lutaml-model bump
- Versioning and cross-namespace specs block on C.08

## Verification

Each new spec file passes locally and on CI. Coverage stays at ≥99.5%.
