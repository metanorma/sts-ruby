# D.11: Docs and README refresh

**Status**: deferred. Low priority but accumulates debt.
**Estimated effort**: small.

## Problem

Several docs reference outdated state:

- `README.adoc` — likely doesn't mention 0.6.x features (V2/V3 MathML host
  binding, the namespace-independence principle, the strengthened
  anti-pattern enforcement)
- `CLAUDE.md` — gives architecture guidance but predates the 2026-05-07
  ADR, the recent unification work, the TODO.finalize/ series, and the
  new TODO.roadmap/
- `TODO.sts-refactor/` — mostly historical; the overview at
  `00-overview.md` should link to `TODO.roadmap/00-overview.md` as the
  current source of truth
- Cross-references between TODO docs use stale ref counts (e.g.,
  "63→16" appears in some places even after PRs reduced it to 11)

## Plan

1. **README** — refresh to mention:
   - The IsoSts/NisoSts independence contract
   - How to construct documents (which Fn/DispQuote/BoxedText class to use)
   - MathML host binding (V2 for IsoSts, V3 for NisoSts)
   - Anti-pattern enforcement (link to `spec/anti_patterns_spec.rb`)
2. **CLAUDE.md** — refresh architecture section to reflect:
   - The ADR 2026-05-07 (IsoSts/NisoSts independence)
   - Current autoload conventions (no `require_relative`, no internal
     `require`)
   - The anti-pattern rules now enforced by spec
3. **TODO.sts-refactor/00-overview.md** — add a header noting that
  `TODO.roadmap/` is the current source of truth; this directory is
  retained for history
4. **Cross-reference cleanup** — search and update stale ref counts
   across all TODO docs

## How to apply

- One PR with all doc updates
- Coordinate with any in-flight code PRs to avoid stale doc references
- Consider an ADR directory (`docs/adr/`) for the architectural decisions;
  currently they're embedded in TODO docs which is fragile

## Verification

- All Markdown links resolve
- Code examples in docs still work (copy-paste runnable)
- No stale references to deleted classes (TbxIsoTml::Fn, TbxIsoTml::Math,
  Sts::Mathml::Math, etc.)
