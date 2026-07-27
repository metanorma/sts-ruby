# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) for working with code in this repository.

## Build and Test Commands

```bash
# Run all tests + rubocop (default task)
bundle exec rake

# Run tests only
bundle exec rspec

# Run a specific spec file
bundle exec rspec spec/iso_sts/iso_sts_element_spec.rb

# Run rubocop
bundle exec rubocop

# Auto-fix linting offenses
bundle exec rubocop -a
```

## Architecture

sts-ruby is a Ruby gem for parsing and serialising NISO STS, ISOSTS, and
TBX-ISO-TML XML documents. It uses `lutaml-model` for declarative
serialisation.

### Namespace structure

```
Sts
├── IsoSts         # ISOSTS v1.1 (frozen legacy, 2013 DTD)
├── NisoSts        # NISO STS (evolving: 1.0, 1.2)
├── TbxIsoTml      # TBX-ISO-TML (ISO 30042, shared)
├── Namespaces     # XML namespace class declarations (TbxNamespace)
├── Profiles       # ISO/IEC document profile validator
└── VERSION
```

### Architectural principle: namespace independence

ISOSTS and NISO STS are independent schemas that genuinely diverge.
Each `Sts::<Namespace>::<Class>` is modelled from its own schema source
(`reference-docs/isosts-v1/xsd/ISOSTS.xsd` for IsoSts,
`reference-docs/NISO-STS-extended-1-MathML3-XSD/` for NisoSts). NEVER:

- Alias `IsoSts::<X> = NisoSts::<X>` (couples the namespaces)
- Create a shared `Sts::Base::<X>` that both inherit from
- Reuse NisoSts types inside IsoSts or vice versa

TBX is shared (used by both IsoSts and NisoSts hosts), so cross-references
to `TbxIsoTml::*` are permitted — but each TbxIsoTml class must be a
true TBX-ISO-TML element, not a JATS/NISO STS element misplaced.

See `TODO.roadmap/00-overview.md` for the prioritised roadmap of remaining
work.

### MathML host binding

ISOSTS imports `ncbi-mathml2/mathml2.xsd` (MathML 2). NISO STS uses
MathML 3. TBX-ISO-TML is hosted under either. Bind per host:

- `IsoSts::*` math attributes → `Mml::V2::Math`
- `TbxIsoTml::*` math attributes → `Mml::V2::Math` (TBX-in-ISOSTS only)
- `NisoSts::*` math attributes → `Mml::V3::Math`

### Element class pattern

```ruby
module Sts
  module IsoSts
    class SomeElement < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      attribute :child, ::Sts::IsoSts::ChildElement, collection: true

      xml do
        element "some-element"
        ordered                 # preserve child order on serialise
        map_attribute "id", to: :id
        map_content to: :content
        map_element "child", to: :child
      end
    end
  end
end
```

### Autoload convention

`lib/sts.rb` autoloads top-level namespaces. `lib/sts/<namespace>.rb`
autoloads every class in that namespace, organised by category with
leading comments and alphabetical order within each group.

External gems are eager-required at the top of `lib/sts.rb`
(`require "lutaml/model"`, `require "mml"`). Internal code never uses
`require_relative` or `require` with internal paths — autoload only.
Enforced by `spec/anti_patterns_spec.rb`.

### Anti-patterns (forbidden; enforced by spec)

`spec/anti_patterns_spec.rb` runs 9 per-file checks on every `lib/` file:

- `method_missing`, `respond_to_missing?` — forbidden (hides interfaces)
- `Object.const_get` — forbidden (runtime string lookup)
- `.send(` — forbidden (bypasses access control)
- `instance_variable_set` / `instance_variable_get` — forbidden (breaks encapsulation)
- `respond_to?` type-checks — forbidden (use `is_a?` or redesign so the check isn't needed)
- Hand-rolled serialization methods on `Serializable` subclasses:
  `to_h`, `to_hash`, `from_h`, `from_hash`, `to_json`, `from_json`,
  `serialize`, `deserialize`, `to_xml`, `from_xml` — forbidden
  (use `attribute` + `mapping`; framework-generated serialisation is correct)
- `require_relative` in lib/ — forbidden (use autoload)
- `require` with internal library path — forbidden (use autoload;
  external gems like `lutaml/model` are allowlisted)

### Schema authority

For any new IsoSts element, generate the attribute list from
`reference-docs/isosts-v1/xsd/ISOSTS.xsd` directly. Don't copy from
NisoSts — the schemas disagree on most elements. Attribute-list
specifications ("X models its configured attribute set") are the
project's defence against drift, since round-tripping alone cannot prove
schema conformance.

### Spec patterns

- **Attribute-set assertions** — `expect(Foo.attributes.keys).to match_array(%i[id content_type ...])`
- **Child-type assertions** — `expect(Bar.attributes[:foo].type).to eq(Baz)`
- **Round-trip tests** — `expect(Foo.to_xml(Foo.from_xml(xml))).to be_xml_equivalent_to(xml)`
- **Schema-validation tests** — `spec/schema_validation_spec.rb` validates
  IsoSts output against ISOSTS.xsd directly via Nokogiri::XML::Schema

### Reference data

- ISOSTS XSD: `reference-docs/isosts-v1/xsd/ISOSTS.xsd`
- NISO STS XSD: `reference-docs/NISO-STS-extended-1-MathML3-XSD/`
- TBX schema (under ISOSTS): `reference-docs/isosts-v1/xsd/tbx.xsd`
- Test fixtures: `spec/fixtures/`
- TODO roadmap: `TODO.roadmap/`
