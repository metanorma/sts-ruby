# sts-ruby + lutaml-model Finalization Plan

**Date**: 2026-07-25
**Trigger**: User-reported `NoMethodError: paragraph` on `Sts::TbxIsoTml::Fn` nested inside `Sts::NisoSts::Back` (rice.xml e2e).
**Status**: PR #1 (sts-ruby dedup) in flight; PR #2 (lutaml-model) deferred per downstream maintainer feedback.

## Root Cause Summary

Two layered bugs:

1. **sts-ruby**: `Sts::TbxIsoTml::Fn` (Ruby attr `:p`) and `Sts::NisoSts::Fn` (Ruby attr `:paragraph`) are duplicate `<fn>` classes with conflicting Ruby attribute names. `TbxIsoTml::FnGroup` similarly duplicates `NisoSts::FnGroup`. Six `Fn`/`FnGroup` classes exist across three namespaces; only four are schema-correct.
2. **lutaml-model**: `Lutaml::Xml::TransformationSupport::ElementBuilder#create_nested_model_element` uses the rule's cached `child_transformation` (keyed on declared `attribute_type`) regardless of the value's actual class. When a caller assigns an unrelated `Serializable` to a typed slot, the wrong transformation is applied silently, producing confusing `NoMethodError`s.

The cache itself is correct (`transformation_key` includes `object_id`). The bug is in the dispatch logic.

## Architecture Decision (PR #1)

`<fn>` and `<fn-group>` are JATS / NISO STS elements (per ISOSTS.xsd and NISO-STS-extended-1.xsd). They are **not** TBX-ISO-TML elements (TBX-ISO-TML is ISO 30042, a terminology model). The presence of `TbxIsoTml::Fn` and `TbxIsoTml::FnGroup` is a misclassification — same pattern as the prior `TbxIsoTml::Math` removal in commit `9e977a5`. Remove them.

Per [[architecture-namespace-independence]]:
- `IsoSts::*` references use `IsoSts::Fn` / `IsoSts::FnGroup` (independence from NisoSts).
- `NisoSts::*` references continue to use `NisoSts::Fn` / `NisoSts::FnGroup`.
- `TbxIsoTml::*` references follow the existing `TbxIsoTml::Bold` / `TbxIsoTml::Italic` precedent (both already use `NisoSts::Fn`): use `NisoSts::Fn` / `NisoSts::FnGroup`. TBX is a shared namespace.

## Decision: Defer PR #2 (lutaml-model)

Downstream metanorma-iso maintainer reviewed the plan and recommended defer:
> #2 is a real robustness win but introduces a new contract that may break
> other downstream consumers who've been quietly relying on the current
> lenient behavior. Worth doing eventually, but urgency drops once #1 lands.

Once #1 lands, the trap cannot be triggered via the original repo's classes. The lenient dispatch remains a robustness gap for future duplicates — see TODO 10 (audit other potential duplicates).

## Execution Order

| # | File | Status |
|---|---|---|
| 01 | investigation findings | complete |
| 02 | delete `TbxIsoTml::Fn` / `TbxIsoTml::FnGroup` | complete |
| 03 | repoint IsoSts call sites to `IsoSts::Fn` | complete |
| 04 | repoint TbxIsoTml call sites to `NisoSts::Fn` | complete |
| 05 | sts-ruby regression specs | complete |
| 06 | lutaml-model `ElementBuilder` dispatch fix | **deferred** |
| 07 | lutaml-model specs | **deferred** |
| 08 | sts-ruby PR | in flight |
| 09 | lutaml-model PR | **deferred** |
| 10 | audit other potential duplicates | deferred (future) |
| 11 | strengthen `anti_patterns_spec.rb` | deferred (future) |

## Principles enforced (PR #1)

- **MECE**: each Fn class lives in exactly one namespace; no parallel hierarchies.
- **Model-driven**: every `<fn>` reference is a typed `attribute :fn, ::Sts::<Namespace>::Fn`.
- **OCP**: adding a new host namespace = adding new Fn classes there, not editing existing ones.
- **DRY**: one class per (namespace, XML element) pair.
- **No anti-patterns**: no `send`, no `instance_variable_set/get`, no `respond_to?`, no `require_relative` in lib.
