# C.06: MathmlNamespace deduplication

**Status**: blocked on A.01 (lutaml-model namespace_scope URI matching).
**Estimated effort**: trivial (delete one class, two `namespace_scope`
entries).

## Problem

`Sts::Namespaces::MathmlNamespace` (lib/sts/namespaces.rb:5-8) and
`Mml::Namespace` (mml gem's top-level namespace class) both encode:

```ruby
uri "http://www.w3.org/1998/Math/MathML"
prefix_default "mml"
```

Two classes, same URI/prefix. The current `namespace_scope` workaround on
`IsoSts::Standard` and `NisoSts::Standard` lists both:

```ruby
namespace_scope [
  ::Sts::Namespaces::MathmlNamespace,
  ::Mml::Namespace,
  ::Sts::Namespaces::TbxNamespace,
  ::Lutaml::Xml::W3c::XlinkNamespace,
]
```

This is the documented smell noted in memory `mml-gem-integration-failure`
("namespace_scope duplication is a known smell"). It exists because
lutaml-model's `namespace_scope` matches by class identity, not by URI.

## Plan

Once A.01 lands upstream and sts-ruby has bumped its lutaml-model dep:

1. Delete `Sts::Namespaces::MathmlNamespace` from `lib/sts/namespaces.rb`.
2. Replace both `namespace_scope` entries with `::Mml::Namespace` only.
3. Audit any other references to `MathmlNamespace` (likely only
   `lib/sts/niso_sts/mml_content.rb:10` — but that whole module is
   being deleted by C.05).

## Verification

- `grep -rn "MathmlNamespace" lib/` returns nothing
- TBX round-trip fixtures still preserve `<mml:math>` prefix
- NISO STS fixtures still preserve `<mml:math>` prefix
- IsoSts fixtures (V2) still preserve `<mml:math>` prefix

## How to apply

- Coordinate with A.01 — file the BUGREPORT first, then either propose the
  upstream fix or wait for it
- When the upstream fix is in a released lutaml-model version, bump
  sts.gemspec and ship this cleanup as a follow-up PR

See also: TODO.sts-refactor/03-namespace-coupling.md "MathML wrapper"
discussion (now historical — the wrapper itself was deleted in 9e977a5,
but the namespace duplication remains).
