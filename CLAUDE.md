# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build and Test Commands

```bash
# Run tests
bundle exec rspec

# Run tests with specific file
bundle exec rspec spec/sts_spec.rb

# Run RuboCop linting
bundle exec rubocop

# Run both (default task)
bundle exec rake
```

## Architecture

This is a Ruby gem for parsing NISO STS (National Information Standards Organization - Science and Technical Standards) XML documents. It uses `lutaml-model` for XML serialization/deserialization.

### Namespace Structure

```
Sts
├── NisoSts        # NISO STS elements (lib/sts/niso_sts/)
│   ├── MmlContent # MathML content elements (autoloaded)
│   └── Xi, Ali   # Module elements
├── TbxIsoTml     # TBX ISO TML elements (lib/sts/tbx_iso_tml/)
├── Mathml        # MathML namespace wrapper
└── Namespaces    # XML namespace definitions
```

### Key Implementation Patterns

**Element Classes** (in `lib/sts/niso_sts/`):
- Inherit from `Lutaml::Model::Serializable`
- Define attributes and XML mapping in `xml do ... end` block
- Use `map_element` to map child elements, `map_content` for text content
- Use `mixed_content` for elements that contain both text and child elements

**Example element structure:**
```ruby
module Sts
  module NisoSts
    class SomeElement < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string
      attribute :child, ::Sts::NisoSts::ChildElement

      xml do
        element "some-element"
        map_attribute "id", to: :id
        map_content to: :content
        map_element "child", to: :child
      end
    end
  end
end
```

**Autoload Pattern**: Elements are autoloaded via `lib/sts/niso_sts.rb`. When adding new elements, add autoloads in alphabetical order.

**Bold/Italic Elements**: These use `::Sts::TbxIsoTml::Bold` and `::Sts::TbxIsoTml::Italic` types (not `:string`), enabling proper round-tripping of nested markup.

### Reference Data

- XSD schema: `reference-docs/NISO-STS-extended-1-MathML3-XSD/`
- Test fixtures: `spec/fixtures/`
