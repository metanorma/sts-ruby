# A.01: lutaml-model `namespace_scope` URI-based matching

**Status**: BUGREPORT drafted; sts-ruby fix blocked on upstream.
**Repo**: `lutaml/lutaml-model`
**Estimated effort**: small (lutaml-model: ~20 lines + spec; sts-ruby: ~5 lines once landed)

## Problem

`namespace_scope` in `Lutaml::Model::Serializable.xml do … end` currently
matches namespace classes by **identity** (`==`), not by URI. Two classes
that declare the same URI/prefix are treated as different namespaces, so a
parent that lists one cannot satisfy a child that declares the other.

## Real-world symptom in sts-ruby

`Sts::Namespaces::MathmlNamespace` (lib/sts/namespaces.rb) and
`Mml::Namespace` (the mml gem's top-level namespace class) both encode:

```ruby
uri "http://www.w3.org/1998/Math/MathML"
prefix_default "mml"
```

They are different classes (different `object_id`s). When `Mml::V3::Math` is
nested inside `Sts::NisoSts::Standard`, the parent's `namespace_scope` lists
`MathmlNamespace`. The child declares `Mml::Namespace`. Identity comparison
fails, the `mml:` prefix is dropped on serialization.

The current workaround — listing both classes in `namespace_scope`:

```ruby
namespace_scope [
  ::Sts::Namespaces::MathmlNamespace,
  ::Mml::Namespace,
  ::Sts::Namespaces::TbxNamespace,
  ::Lutaml::Xml::W3c::XlinkNamespace,
]
```

— is a DRY violation. It documents the lutaml-model limitation rather than
fixing it. See `lib/sts/iso_sts/standard.rb:18-19` and
`lib/sts/niso_sts/standard.rb:20-21`.

## Proposed lutaml-model fix

In `Lutaml::Xml::NamespaceScope` (or wherever the membership check lives),
compare by URI instead of (or in addition to) class identity. The public
API doesn't change; only the matching semantics do.

```ruby
# pseudocode
def includes?(namespace_class)
  namespaces.any? do |declared|
    declared.uri == namespace_class.uri
  end
end
```

## Files

- `BUGREPORT.namespace-scope-uri-matching.md` in
  `~/src/lutaml/lutaml-model/` (this track files it)
- lutaml-model spec: `spec/lutaml/xml/namespace_scope_spec.rb` — assert that
  two classes with the same URI are equivalent for `namespace_scope`
- sts-ruby: remove the duplicated `MathmlNamespace` entry from
  `IsoSts::Standard` and `NisoSts::Standard` once the upstream fix lands

## Verification

- Reproduction case (currently failing in 0.8.18):

  ```ruby
  class A < Lutaml::Model::Serializable
    xml do
      namespace SomeNs   # uri "urn:test", prefix "t"
      element "a"
    end
  end
  class B < Lutaml::Model::Serializable
    xml do
      namespace OtherNs  # also uri "urn:test", prefix "t" — different class
      element "b"
    end
  end
  class Parent < Lutaml::Model::Serializable
    attribute :child, B
    xml do
      namespace_scope [SomeNs]
      map_element "child", to: :child
    end
  end
  # Currently: child's prefix is dropped on serialize.
  # After fix: child's prefix is preserved (URIs match).
  ```

## Why not fix in sts-ruby today

Cannot: the duplication is the only way to make `Mml::V3::Math` and
`Mml::V2::Math` serialize with the `mml:` prefix inside STS Standard
elements. Removing `MathmlNamespace` without the upstream fix would
silently drop the prefix on every IsoSts/NisoSts document with MathML
content.

Track C.06 (MathmlNamespace deduplication) is the sts-ruby cleanup; it
blocks on this track.

## How to apply

1. File BUGREPORT in `~/src/lutaml/lutaml-model/BUGREPORT.namespace-scope-uri-matching.md`.
2. Optionally open PR upstream with the fix sketch above.
3. After upstream lands and sts-ruby bumps its lutaml-model dep, do C.06.
