# 05: Add sts-ruby regression specs

**Status**: pending
**Blocked by**: 02, 03, 04

## Why

Round-tripping alone cannot catch this class of bug — the wrong-type assignment only fails when nested two levels deep, and a future contributor could re-introduce `TbxIsoTml::Fn` thinking it is a reasonable place for a TBX footnote. Specs must assert:

1. The deleted constants stay deleted.
2. Each call site uses the correct namespace's Fn.
3. The original bug repro (NisoSts::Back wrapping TbxIsoTml-style Fn usage) no longer raises — but this is now impossible to express directly because TbxIsoTml::Fn is gone. Instead, assert that a NisoSts::Back → NisoSts::FnGroup → NisoSts::Fn serialization round-trips, and the original error message ("undefined method 'paragraph'") cannot occur.

## Actions

- [x] Add `spec/fn_namespace_spec.rb` asserting:
  - `Sts::TbxIsoTml.const_defined?(:Fn)` is `false`
  - `Sts::TbxIsoTml.const_defined?(:FnGroup)` is `false`
  - `lib/sts/iso_sts/**/*.rb` files reference `IsoSts::Fn` / `IsoSts::FnGroup`, never `TbxIsoTml::Fn`
  - `lib/sts/tbx_iso_tml/**/*.rb` files reference `NisoSts::Fn` / `NisoSts::FnGroup`, never `TbxIsoTml::Fn`
  - Cross-namespace `Fn`/`FnGroup` instantiation and round-trip works through `NisoSts::Back → NisoSts::FnGroup → NisoSts::Fn`
- [x] Run full suite, confirm green.

## Verification

- New spec file passes (14+ examples).
- Full suite: 2300+ examples, 0 failures.
