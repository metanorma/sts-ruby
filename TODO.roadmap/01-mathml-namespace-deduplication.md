# 01: MathmlNamespace deduplication (DONE)

**Status**: complete (2026-07-27).
**Originally tracked as**: `01-lutaml-model-namespace-scope-uri-matching.md`
(misdiagnosed as a lutaml-model bug) and `06-mathml-namespace-deduplication.md`
(blocked on the misdiagnosed upstream fix). Merged and completed here.

## Original misdiagnosis

When sts-ruby unified Presentation MathML on the mml gem (commit 9e977a5),
the `mml:` prefix was dropped on serialization unless both
`Sts::Namespaces::MathmlNamespace` AND `Mml::Namespace` were listed in
`IsoSts::Standard#namespace_scope` / `NisoSts::Standard#namespace_scope`.

The initial diagnosis (filed as `BUGREPORT.namespace-scope-uri-matching.md`
in lutaml-model) blamed `namespace_scope` for matching by class identity
instead of URI. The proposed fix was to change lutaml-model's matching
semantics.

## Actual root cause

**sts-ruby had two Ruby classes for one XML namespace.** A namespace IS
its URI (per Namespaces in XML 1.0). `Sts::Namespaces::MathmlNamespace`
and `Mml::Namespace` both declared:

```ruby
uri "http://www.w3.org/1998/Math/MathML"
prefix_default "mml"
```

They were the same namespace. The duplication was the smell; the
"workaround" of listing both was actually papering over the duplication.

The BUGREPORT was retracted. The fix is purely sts-ruby's responsibility.

## Fix shipped (2026-07-27)

- Deleted `Sts::Namespaces::MathmlNamespace` from `lib/sts/namespaces.rb`.
- Replaced `::Sts::Namespaces::MathmlNamespace` with `::Mml::Namespace` in:
  - `lib/sts/iso_sts/standard.rb`
  - `lib/sts/niso_sts/standard.rb`
  - `lib/sts/niso_sts/mml_content.rb` (the Content MathML module — still
    scheduled for unification per TODO.roadmap/05)
- Added 4 regression specs asserting `MathmlNamespace` is undefined and
  `Mml::Namespace` is used directly.

## Verification

- 5153 examples, 0 failures.
- TBX fixture round-trip preserves `<mml:math>` prefix.
- NISO STS fixture round-trip preserves `<mml:math>` prefix.
- `grep -rn "MathmlNamespace" lib/` returns nothing.

## Lesson

When you see a "framework limitation" that requires you to declare
something twice, the more likely explanation is that you have two
definitions of the same thing. Namespaces in particular are URI-identified;
two classes for one URI is a DRY violation, not a framework bug.

Memory updated: `mml-gem-integration-failure` no longer describes the
`namespace_scope` duplication as a "known smell" — it's resolved.
