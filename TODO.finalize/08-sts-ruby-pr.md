# 08: Open sts-ruby PR

**Status**: pending
**Blocked by**: 02, 03, 04, 05

## Actions

- [x] Branch `fix/remove-tbxisotml-fn-duplicate` off latest `main`.
- [x] Commit steps 02–05 with a clear message.
- [x] Push, open PR against `metanorma/sts-ruby`.
- [x] PR body via `--body-file` (contains backticks — never inline).

## PR description points

- Root cause: duplicate `<fn>` classes across namespaces with conflicting Ruby attr names.
- Why TbxIsoTml loses its Fn/FnGroup: `<fn>` is not a TBX-ISO-TML element.
- Why IsoSts keeps its own: namespace independence (per ADR 2026-05-07).
- Why TbxIsoTml call sites use NisoSts::Fn: matches existing Bold/Italic pattern; TBX is shared.
- Behaviour change: callers that construct IsoSts documents using `TbxIsoTml::Fn` must now use `IsoSts::Fn` (drop-in: same `:paragraph` Ruby attr).
- References TODO.finalize/00-overview.md.
