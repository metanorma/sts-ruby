# 02: Delete `Sts::TbxIsoTml::Fn` and `Sts::TbxIsoTml::FnGroup`

**Status**: pending
**Blocks**: 03, 04, 05

## Why

`<fn>` and `<fn-group>` are JATS / NISO STS elements. They are not defined by TBX-ISO-TML (ISO 30042). The `TbxIsoTml::Fn` and `TbxIsoTml::FnGroup` classes are misclassified duplicates of `NisoSts::Fn` / `NisoSts::FnGroup` with one schema-breaking difference: the Ruby attribute for `<p>` is `:p` in TbxIsoTml and `:paragraph` in every other namespace. This mismatch is the root cause of the user-reported `NoMethodError`.

## Actions

- [x] Delete `lib/sts/tbx_iso_tml/fn.rb`
- [x] Delete `lib/sts/tbx_iso_tml/fn_group.rb`
- [x] Remove `autoload :Fn` and `autoload :FnGroup` from `lib/sts/tbx_iso_tml.rb`
- [x] Run `bundle exec rspec` — confirm no spec references the deleted constants

## Verification

- `grep -rn "TbxIsoTml::Fn\b\|TbxIsoTml::FnGroup\b" lib/ spec/` returns nothing after steps 03 and 04 complete.
- `Sts::TbxIsoTml.const_defined?(:Fn)` is `false`.
