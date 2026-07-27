# sts-ruby + lutaml-model Roadmap

**Date**: 2026-07-27
**Replaces**: `TODO.sts-refactor/00-overview.md` (now mostly historical — that
series landed through PRs #31, #40 work, #42, #44–#50). This roadmap covers
all remaining work across both repos.

## Status at start (2026-07-27)

- **sts gem**: 0.6.6 on RubyGems
- **Issue #40**: 11 IsoSts→NisoSts refs remaining (5 recursive roots +
  4 child-bearing roots + 2 already-enumerated ArticleTitle / ElementCitation
  co-roots)
- **Open PRs/Issues**: #40 (umbrella)
- **Anti-pattern enforcement**: 9 per-file checks in
  `spec/anti_patterns_spec.rb`; covers all global rules
- **Tests**: 2563 examples, 0 failures

## Tracks

Work is grouped into four MECE tracks. Each track is independent unless
noted.

| Track | Subject | Items |
|---|---|---|
| A | lutaml-model upstream analysis (filed as robustness suggestions) | 02 |
| B | Issue #40 namespace coupling completion | 01 (done), 03 (done), 04 |
| C | Architectural improvements (DRY, versioning, audit) | 05, 07, 08 |
| D | Quality, specs, and coverage | 09, 10, 11 |

## Priority order

The priority is "highest leverage per unit of risk" first:

1. **B.01** (MathmlNamespace deduplication): DONE 2026-07-27. sts-ruby had
   two Ruby classes for one XML namespace; deleted one, use `Mml::Namespace`
   directly. Originally misdiagnosed as a lutaml-model bug — see
   `01-mathml-namespace-deduplication.md` for the lesson.
2. **B.03** (child-bearing roots): DONE 2026-07-27. Modelled License,
   TermHead, CustomMetaGroup closures. Closed 5 of 11 issue #40 refs.
3. **A.02** (lutaml-model ElementBuilder dispatch): filed as
   `BUGREPORT.element-builder-dispatch-on-value-class.md` in lutaml-model.
   Pure documentation; zero risk. **Reframed as a robustness suggestion,
   not a bug** — sts-ruby's responsibility to use correct types was the
   actual fix (PR #47 deleted duplicate Fn classes).
4. **C.07** (TbxIsoTml misclassification audit): documents a deferred audit
   (Xref, TableWrap, etc.) — pattern is already proven by Fn/FnGroup and
   Math removals.
5. **C.05** (Content MathML unification): 148 parallel classes in
   `lib/sts/niso_sts/mml_content/` — same DRY argument as Presentation
   MathML unification (commit 9e977a5).
6. **B.04** (recursive roots): the heavy lift. Each root pulls a ~78-element
   mutually-recursive core. Requires per-element planning. Most architecturally
   significant.
7. **C.08** (register versioning): lets ISOSTS v1.1, NISO STS 1.0, NISO STS 1.2
   coexist without class-name clashes.
8. **D.09, D.10, D.11** (quality, coverage, docs): ongoing.

## Architectural principles (enforced on all new work)

- **MECE**: each model class lives in exactly one namespace; no parallel
  hierarchies across namespaces.
- **Model-driven**: every XML element reference is a typed
  `attribute :foo, ::Sts::<Namespace>::Foo`. No runtime string lookup.
- **Open/Closed**: adding a new STS host namespace = adding a new Foo class
  there, not editing existing namespaces.
- **DRY**: one class per (namespace, XML element) pair. Shared attribute
  patterns within a namespace use Ruby modules (not cross-namespace base
  classes — those are forbidden by the 2026-05-07 ADR).
- **No anti-patterns**: no `send`, no `instance_variable_set/get`, no
  `respond_to?` type-checks, no `require_relative` in lib/ (autoload only),
  no `require` with internal library paths. Enforced by
  `spec/anti_patterns_spec.rb`.
- **Autoload convention**: top-level `lib/sts.rb` autoloads namespaces;
  `lib/sts/<namespace>.rb` autoloads classes. Alphabetical within category
  groups.

## Memory cross-references

- [[architecture-namespace-independence]] — IsoSts/NisoSts never share base types
- [[duplicate-fn-class-attribute-mismatch]] — the trap A.02 prevents
- [[isosts-uses-mathml2-not-mathml3]] — V2/V3 host binding pattern
- [[mml-gem-integration-failure]] — MathmlNamespace duplication context
- [[release-workflow-two-phase]] — release flow
- [[ci-rubocop-stricter-than-local]] — substring-check convention
