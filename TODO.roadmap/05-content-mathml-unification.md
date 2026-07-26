# C.05: Content MathML unification on the mml gem

**Status**: planning. Medium-large effort (148 classes to migrate).
**Depends on**: nothing (independent of A.01, A.02).
**Memory**: `mml-gem-integration-failure` (Presentation MathML is already
unified; Content MathML is not).

## Problem

`lib/sts/niso_sts/mml_content/` ships 148 Content MathML classes (Apply,
Bind, Ci, Cn, Plus, Eq, Lambda, etc.) as a parallel in-gem implementation.
The mml gem has its own Content MathML set under `Mml::V2::*` and
`Mml::V3::*` (same pattern as the Presentation MathML it already provides,
which we unified in commit 9e977a5).

The duplication means:
- Two implementations of every Content MathML element
- Attribute sets can drift between them (no schema sync)
- sts-ruby users get sts-specific behavior, not mml-gem-correct behavior
- Bug fixes have to land in both repos

## Plan

Same pattern as commit 9e977a5 (which deleted `TbxIsoTml::{Math, Mrow, Mi,
…}` and replaced with `Mml::V2::Math` / `Mml::V3::Math`):

1. **Inventory** — `ls lib/sts/niso_sts/mml_content/` to enumerate the 148
   classes (already autoloaded in `lib/sts/niso_sts/mml_content.rb`).
2. **Verify mml gem coverage** — for each sts class, confirm the mml gem
   has an equivalent (under `Mml::V2::*` and/or `Mml::V3::*`).
3. **Repoint** — every `Sts::NisoSts::MmlContent::*` reference becomes
   `Mml::V2::*` (for ISOSTS-hosted documents) or `Mml::V3::*` (for NISO STS).
   Follow the host-binding pattern established in PR #45.
4. **Delete** — once all references are repointed, delete
   `lib/sts/niso_sts/mml_content/` entirely (and its autoload block).
5. **Spec** — round-trip tests for documents with Content MathML must
   continue to pass.

## Risks

- **Coverage gap**: if the mml gem lacks a class for some sts Content
  element, the migration is blocked. Mitigation: contribute the missing
  class to the mml gem first.
- **Attribute divergence**: sts Content classes may have attributes the
  mml gem lacks (or vice versa). Schema authority is `mathml3.xsd` (NISO
  STS host) or `ncbi-mathml2/content/*.xsd` (ISOSTS host).
- **MathML version**: same V2/V3 split as Presentation MathML. sts Content
  classes are version-agnostic; the mml gem's are not. Migration must
  preserve the host-binding pattern.

## Files affected

- `lib/sts/niso_sts/mml_content.rb` (the autoload block; will be deleted)
- `lib/sts/niso_sts/mml_content/*.rb` (~30 files, 148 classes total via
  grouping files like `operators.rb`, `relations.rb`, `containers.rb`)
- Any `NisoSts::*` class that references `MmlContent::*` (audit with
  `grep -rn "MmlContent::" lib/`)
- `lib/sts/namespaces.rb` — `MathmlNamespace` (relevant if A.01 hasn't
  landed; the cleanup in C.06 may run before this)

## How to apply

- Read [[isosts-uses-mathml2-not-mathml3]] for the host-binding pattern
- Read [[mml-gem-integration-failure]] for why the analogous Presentation
  MathML unification took two attempts
- Open as a series of PRs (one per mml_content subdirectory) rather than
  one giant PR; each PR closes one grouping file
- Final PR deletes the directory and the autoload block

## Verification

- `bundle exec rspec spec/round_trip/reference_docs_spec.rb` — all
  reference docs with Content MathML still round-trip
- `grep -rn "MmlContent::" lib/` returns nothing after the final PR
- Rubocop clean
