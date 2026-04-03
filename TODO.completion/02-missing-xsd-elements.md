# Priority B: Missing XSD Elements

## Issue

Elements defined in the NISO STS XSD that were not implemented in the Ruby library.

## Investigation Results

Searched all 6 test fixture files - **none contain** any of the potentially missing elements:
- `index-term` or `index-term-range-end`
- `glyph`, `kbd`, `option`, `seq`, `term-span`, `stream`

These elements exist in the XSD schema definition but are not used in actual XML files.

## Conclusion

**Not Currently Needed**

The current implementation works for all test fixtures. These elements can be implemented when/if they are needed.

## Implementation (If Needed Later)

1. Create `lib/sts/niso_sts/index_term.rb` with proper structure based on XSD
2. Create `lib/sts/niso_sts/index_term_range_end.rb` if needed
3. Add autoloads to `lib/sts/niso_sts.rb`

## Status

- [x] Searched XSD for index-term-model group definition
- [x] Verified which elements are actually needed
- [x] **Conclusion: Not needed for current fixtures**

---
**Priority B is effectively complete - no action needed.**
