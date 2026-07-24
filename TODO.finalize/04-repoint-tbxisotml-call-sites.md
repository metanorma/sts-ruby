# 04: Repoint TbxIsoTml call sites to `NisoSts::Fn`

**Status**: pending
**Blocked by**: 02

## Why

After step 02 deletes `TbxIsoTml::Fn` / `TbxIsoTml::FnGroup`, the 4 TbxIsoTml files that referenced them must point somewhere. Following the established `TbxIsoTml::Bold` / `TbxIsoTml::Italic` precedent (both already use `NisoSts::Fn`), use `NisoSts::Fn` / `NisoSts::FnGroup`.

TBX-ISO-TML is a shared namespace (per [[architecture-namespace-independence]]: "independence from NisoSts is not independence in general"). `<fn>` inside a TBX table cell is a NISO STS element borrowed into TBX context, so the NISO STS type is the correct reference.

## Actions

- [x] `lib/sts/tbx_iso_tml/td.rb:94` — `::Sts::TbxIsoTml::Fn` → `::Sts::NisoSts::Fn`
- [x] `lib/sts/tbx_iso_tml/th.rb:95` — same
- [x] `lib/sts/tbx_iso_tml/table_wrap_foot.rb:7` — `::Sts::TbxIsoTml::FnGroup` → `::Sts::NisoSts::FnGroup`
- [x] `lib/sts/tbx_iso_tml/table_wrap_foot.rb:13` — `::Sts::TbxIsoTml::Fn` → `::Sts::NisoSts::Fn`

`lib/sts/tbx_iso_tml/fn_group.rb` is deleted in step 02 — no repoint needed.

## Verification

- `grep -rn "TbxIsoTml::Fn\b\|TbxIsoTml::FnGroup\b" lib/sts/tbx_iso_tml/` returns nothing.
- `bundle exec rspec` green.
