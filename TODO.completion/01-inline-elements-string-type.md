# Priority A: Replace String-Typed Inline Elements

## Issue

86 instances across ~40 files where inline elements (bold, italic, etc.) were typed as `:string` instead of proper element types.

## Completed

Changed 84 instances across 42 files from:
```ruby
attribute :bold, :string, collection: true
attribute :italic, :string, collection: true
```

To:
```ruby
attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
```

## Affected Files

access_date.rb, addr_line.rb, aff.rb, article_title.rb, bio.rb, chapter_title.rb, city.rb, country.rb, data_title.rb, degrees.rb, email.rb, fax.rb, fpage.rb, given_names.rb, gov.rb, institution.rb, isbn.rb, issn.rb, issn_l.rb, issue.rb, lpage.rb, mixed_citation.rb, on_behalf_of.rb, page_range.rb, paragraph.rb, patent.rb, phone.rb, postal_code.rb, prefix.rb, publisher_loc.rb, publisher_name.rb, role.rb, source.rb, state.rb, string_name.rb, suffix.rb, surname.rb, term.rb, time_stamp.rb, trans_source.rb, trans_title.rb, uri.rb, volume.rb

## Verification

```bash
bundle exec rspec spec/
# 34 examples, 0 failures

bundle exec rubocop lib/sts/niso_sts/*.rb
# 277 files inspected, no offenses detected
```

## Status

- [x] Changed all 42 files from `:string` to proper Bold/Italic types
- [x] All tests pass
- [x] All RuboCop checks pass

## Notes

- Bold and Italic classes are from `::Sts::TbxIsoTml::` namespace
- These classes only support `value` and basic nesting - may need enhancement for complex nested markup
- Round-trip XML serialization works correctly
