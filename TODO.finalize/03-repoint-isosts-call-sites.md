# 03: Repoint IsoSts call sites to `IsoSts::Fn`

**Status**: pending
**Blocked by**: 02

## Why

Per [[architecture-namespace-independence]], `IsoSts` must be independent of `NisoSts`. The 8 IsoSts files that currently reference `TbxIsoTml::Fn` violate this. They should reference `IsoSts::Fn`, which already exists with the correct ISOSTS schema (5 attributes + label + paragraph + non_normative_note + non_normative_example).

## Actions

For each file, swap `::Sts::TbxIsoTml::Fn` → `::Sts::IsoSts::Fn`:

- [x] `lib/sts/iso_sts/td.rb:28`
- [x] `lib/sts/iso_sts/bold.rb:25`
- [x] `lib/sts/iso_sts/paragraph.rb:27`
- [x] `lib/sts/iso_sts/mixed_citation.rb:22`
- [x] `lib/sts/iso_sts/sec.rb:37`
- [x] `lib/sts/iso_sts/th.rb:28`
- [x] `lib/sts/iso_sts/std.rb:14`
- [x] `lib/sts/iso_sts/italic.rb:25`

## Verification

- `grep -rn "TbxIsoTml::Fn\b" lib/sts/iso_sts/` returns nothing.
- `bundle exec rspec spec/iso_sts/` is green.
- Full suite green (no spec depends on the old typing).
