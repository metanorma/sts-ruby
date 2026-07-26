# B.04: Issue #40 — break the recursive roots

**Status**: planning. Heavy lift; needs per-element design.
**Blocks**: closing issue #40.
**Closes**: 6 of 11 IsoSts→NisoSts refs (5 recursive roots + ArticleTitle).

## Remaining recursive refs

| Class | Referenced from | Approx. closure size |
|---|---|---|
| `IsoSts::ElementCitation` | `IsoSts::Ref#element_citation` | ~78 elements |
| `IsoSts::PersonGroup` | `IsoSts::MixedCitation#person_group` | ~50 elements |
| `IsoSts::Collab` | `IsoSts::MixedCitation#collab` | ~40 elements |
| `IsoSts::Source` | `IsoSts::MixedCitation#source` | ~25 elements |
| `IsoSts::ArticleTitle` | `IsoSts::MixedCitation#article_title` | ~25 elements |
| `IsoSts::TermDisplay` | `IsoSts::TermSec#term_display` | ~30 elements |

Each root reaches the same ~78-element mutually-recursive core
(`sec` → `p` → `disp-quote` → `p`, etc.). The recursion resolves once
every element in the cycle has an IsoSts class.

## Architecture decision needed

Two strategies, mutually exclusive:

### Strategy A: bottom-up leaf modelling

Model every leaf ISOSTS element (no children) first, then bottom-up
through the dependency graph. Eventually every recursive cycle has all
its members as IsoSts classes.

- **Pro**: each PR is small and verifiable
- **Pro**: every modelled leaf reduces the closure of the recursive roots
- **Con**: many PRs (could be 50+); requires tracking the dependency DAG
  in a checklist

### Strategy B: top-down with `raw` mapping

Use lutaml-model's `raw` mapping type to capture the recursive core as
opaque XML strings, then incrementally model the surface elements.

- **Pro**: closes the recursive refs in fewer PRs
- **Con**: `raw` mapping doesn't expose the recursive content as Ruby
  objects — callers can't introspect or modify the captured XML
- **Con**: violates the model-driven principle for the deferred parts

### Recommendation: Strategy A

Track B.03 (child-bearing roots) closes 5 refs with no recursion.
Strategy A is the right continuation: model the next layer of leaves
(elements with no children, or with only already-modelled IsoSts children)
until the recursive roots' closures collapse.

## Tracking the DAG

A `TODO.roadmap/04-dag.md` (this file's sibling) should list every
not-yet-modelled ISOSTS element with:

- Element name
- Whether it has children (and if so, which)
- Whether all its children are already IsoSts classes
- Priority (high if it's referenced by a still-NisoSts ref)

This is mechanical work but tedious. A scripted generator from ISOSTS.xsd
could populate it; the existing `lib/sts/niso_sts/mml_content/` directory
suggests the project has tolerated generated-model code before.

## Per-root breakdown

### `ElementCitation` (~78 elements)

The biggest. The ISOSTS schema for `<element-citation>` is enormous (37+
child elements, many recursive). Schema-correct modelling requires:
- `IsoSts::ElementCitation` itself
- Many `<name>`, `<date>`, `<page>` style leaves — most already exist as
  NisoSts classes; need IsoSts equivalents per namespace independence
- `<person-group>` (also a recursive root — see below)

Likely 10+ PRs to close this root alone.

### `PersonGroup`, `Collab`, `Source`, `ArticleTitle` (~25-50 elements each)

All referenced from `<mixed-citation>`. Each pulls in citation-relevant
inline content. PersonGroup is itself a minor recursive root (contains
`<name>` which contains its own structure).

### `TermDisplay` (~30 elements)

Referenced from `<term-sec>`. Pulls in TBX-flavored terminology elements
plus the regular block-element core.

## Verification

- After each leaf is modelled: `bundle exec rspec` green
- After each root is closed: `grep -rn "NisoSts::<Root>"` returns nothing
- After all 6 roots closed: issue #40 down to ~0 refs (only ArticleTitle
  co-root count check)

## How to apply

- Do B.03 first (closes 5 refs cheaply)
- Then start B.04 with the smallest root (Source or ArticleTitle)
- Track DAG progress in `TODO.roadmap/04-dag.md` (sibling file)
- Each leaf modelled = one PR (same pattern as PRs #48, #50)
- Cross-reference each PR in `TODO.sts-refactor/03-namespace-coupling.md`
