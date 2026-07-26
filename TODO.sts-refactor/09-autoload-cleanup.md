# 09: Autoload and Require Cleanup

**Status**: Refreshed 2026-07-26. Most items done; remaining items noted below.
**Priority**: LOW
**Category**: Cleanup
**Files Affected**: `lib/sts.rb`, `lib/sts/iso_sts.rb`, `lib/sts/niso_sts.rb`

## Done

- **Moxml monkey-patch removed entirely** — upstream fix in moxml aa58888.
  No code lives in `lib/sts.rb` patching `Moxml::Adapter::Nokogiri`.
- **`lib/sts/mathml.rb` deleted** (commit 9e977a5) — Presentation MathML
  unified on the mml gem (`Mml::V3::Math` for NisoSts, `Mml::V2::Math` for
  IsoSts/TbxIsoTml per the host-binding fix in PR #45).
- **`lib/sts/iso_sts/mathml2/` deleted** (this change) — dead-code hack file
  that violated multiple anti-pattern rules. `IsoSts::Mathml2::Math` is gone.
- **`lib/sts/content_groups/` deleted** — was dead code (the only caller,
  `IsoSts::ContentGroups::HighlightElements`, was itself dead).
- **`lib/sts/tbx_iso_tml/fn.rb` and `fn_group.rb` deleted** (PR #47) —
  duplicates of `NisoSts::Fn` / `NisoSts::FnGroup` with conflicting Ruby
  attribute names.
- **Autoload registry is 1:1 with the directory tree** for both `iso_sts/`
  and `niso_sts/`.
- **`require_relative` is forbidden in `lib/`** — enforced by the
  strengthened `spec/anti_patterns_spec.rb` (this change).

## Current autoload conventions

- Top-level: `lib/sts.rb` declares `autoload` for each top-level namespace
  (`IsoSts`, `NisoSts`, `TbxIsoTml`, `Namespaces`, `Profiles`, `VERSION`).
- Each namespace's `lib/sts/<namespace>.rb` file declares `autoload` for
  every class in that namespace, organised by category with leading
  comments. Alphabetical order within each category block.
- External gems are eagerly required at the top of `lib/sts.rb`
  (`require "lutaml/model"`, `require "mml"`). Internal code never uses
  `require` or `require_relative`.

## Remaining items

- **`lib/sts/iso_sts.rb:3` has `require "mml"`** — redundant with the
  top-level require in `lib/sts.rb:4`. Can be removed once verified no
  load-order issue exists. Low priority.
- **Verify no implicit load-order deps remain** — the autoload system
  should resolve all references lazily. If a circular dependency emerges,
  it usually indicates a misnamed constant or a missing autoload entry.

## Verification

```bash
bundle exec rspec spec/anti_patterns_spec.rb    # catches require_relative,
                                                 # internal require, etc.
bundle exec rake                                 # full suite
```
