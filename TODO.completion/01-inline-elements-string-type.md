# Priority A: Replace String-Typed Inline Elements

## Issue

86 instances across ~40 files where inline elements (bold, italic, etc.) are typed as `:string` instead of proper element types.

Example of the problem:
```xml
<source>text <bold>bold</bold></source>
```

When `bold` is typed as `:string`, the nested `<bold>` structure is lost - it gets serialized as plain text instead of a proper child element.

## Affected Elements

### bold (41 files)
- data_title.rb, string_name.rb, postal_code.rb, source.rb, gov.rb, publisher_loc.rb, state.rb, aff.rb, chapter_title.rb, uri.rb, email.rb, surname.rb, country.rb, trans_title.rb, access_date.rb, issn_l.rb, bio.rb, issue.rb, article_title.rb, fpage.rb, volume.rb, mixed_citation.rb, fax.rb, isbn.rb, on_behalf_of.rb, publisher_name.rb, term.rb, time_stamp.rb, issn.rb, patent.rb, paragraph.rb, suffix.rb, page_range.rb, addr_line.rb, degrees.rb, role.rb, institution.rb, trans_source.rb, prefix.rb, city.rb, lpage.rb, phone.rb, given_names.rb

### italic (36 files)
- publisher_loc.rb, state.rb, data_title.rb, chapter_title.rb, aff.rb, string_name.rb, addr_line.rb, country.rb, source.rb, surname.rb, access_date.rb, issn_l.rb, issue.rb, trans_title.rb, postal_code.rb, gov.rb, volume.rb, article_title.rb, email.rb, publisher_name.rb, uri.rb, fax.rb, mixed_citation.rb, paragraph.rb, on_behalf_of.rb, degrees.rb, fpage.rb, given_names.rb, suffix.rb, role.rb, bio.rb, issn.rb, term.rb, patent.rb, isbn.rb, lpage.rb, trans_source.rb, city.rb, page_range.rb, institution.rb, phone.rb, time_stamp.rb, prefix.rb

## Root Cause

The NISO STS schema defines `bold` and `italic` as complex elements with `mixed="true"`, meaning they can contain both text and nested markup:

```xsd
<xsd:element name="bold">
  <xsd:complexType mixed="true">
    <xsd:choice minOccurs="0" maxOccurs="unbounded">
      <xsd:group ref="emphasized-text"/>
    </xsd:choice>
    ...
  </xsd:complexType>
</xsd:element>
```

But in the Ruby implementation, these are mapped as simple strings:
```ruby
attribute :bold, :string, collection: true
```

## Solution Approach

Use lutaml-model's custom value types feature to properly handle mixed content.

Two options:

### Option 1: Custom Value Type for Inline Markup (Recommended)
Create a custom `InlineContent` type that can hold both text and inline elements:

```ruby
class InlineContent < Lutaml::Model::Type::Value
  # Handles mixed content with nested inline elements
end
```

### Option 2: Custom Serializable Type
Create a `MixedContent` class that wraps content and handles XML serialization/deserialization properly.

## Implementation Plan

1. Create a new file `lib/sts/niso_sts/types/inline_content.rb` with a custom type
2. Update one or two representative elements (e.g., `source.rb` and `aff.rb`) to use the new type
3. Test that XML round-trip preserves nested markup
4. If successful, update remaining 38-40 files

## Verification

```bash
bundle exec rspec spec/
# Should pass with proper handling of mixed content like:
# <source>text <bold>bold</bold></source>
```

## Status

- [ ] Analyze lutaml-model custom value types documentation
- [ ] Design InlineContent or MixedContent type
- [ ] Implement in lib/sts/niso_sts/types/
- [ ] Update representative elements (source.rb, aff.rb)
- [ ] Test XML round-trip
- [ ] Update remaining affected files
- [ ] Run full test suite
- [ ] Run RuboCop
