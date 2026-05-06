# 09: Autoload and Require Cleanup

**Priority**: LOW
**Category**: Cleanup
**Estimated Effort**: Medium
**Files Affected**: `lib/sts.rb`, `lib/sts/niso_sts.rb`, `lib/sts/iso_sts.rb`

## Current Issues

### 1. Autoload Alphabetization

The autoload entries in `lib/sts/niso_sts.rb` should be alphabetically ordered. Check for any out-of-order entries when adding new elements.

### 2. Moxml Monkey-Patch

`lib/sts.rb` contains a monkey-patch on Moxml:

```ruby
Moxml::Adapter::Nokogiri.singleton_class.alias_method(:_orig_children, :children)
Moxml::Adapter::Nokogiri.define_singleton_method(:children, &:children)
```

This patches an external library's behavior. If Moxml fixes the underlying issue, this will mask it or cause conflicts.

**Action**: Add a comment explaining WHY this patch exists (the Nokogiri adapter bug it works around) and a link to the upstream issue if tracked.

### 3. Orphaned/Unused Files

After refactoring (TODOs 01-04), check for:
- Files in `lib/sts/niso_sts/` that are no longer referenced
- Files in `lib/sts/iso_sts/` that are no longer referenced
- Unused requires

### 4. Require Order Dependencies

Some files may have implicit load-order dependencies (class A references class B, but B hasn't been loaded yet). The autoload system should handle this, but verify.

### 5. Missing Requires for Cross-Namespace Types

After fixing namespace coupling (TODO 03), ensure all cross-namespace references are replaced with proper requires or base type references.

## File Structure After Cleanup

```
lib/
├── sts.rb                           # Top-level: requires, Moxml patch (documented)
├── sts/
│   ├── namespaces.rb                # Namespace constants
│   ├── mathml.rb                    # MathML wrapper (after TODO 01 fix)
│   ├── mathml/                      # MathML-specific types (if needed)
│   ├── base/                        # Shared base types (after TODO 03)
│   │   ├── text/                    # Bold, Italic, Sub, Sup
│   │   ├── struct/                  # Section, Paragraph, List
│   │   ├── meta/                    # Title, Label, Caption
│   │   └── refs/                    # Xref, BiblioRef
│   ├── iso_sts/                     # ISOSTS namespace
│   │   ├── iso_sts.rb               # Autoload declarations
│   │   ├── v1_1/                    # ISOSTS v1.1 classes
│   │   └── content_groups/          # Content group helpers
│   ├── niso_sts/                    # NISO STS namespace
│   │   ├── niso_sts.rb              # Autoload declarations
│   │   ├── v1_0/                    # NISO STS 1.0 classes
│   │   ├── v1_2/                    # NISO STS 1.2 classes
│   │   ├── content_groups/          # Content group helpers
│   │   ├── mml_content/             # MathML content elements
│   │   └── xi.rb, ali.rb            # Namespace modules
│   ├── tbx_iso_tml/                 # TBX namespace
│   │   ├── tbx_iso_tml.rb           # Autoload declarations
│   │   └── ...
│   ├── content_groups/              # Shared content group helpers
│   │   └── helpers.rb               # After TODO 02 fix
│   └── profiles/                    # ISO/IEC validation layer (after TODO 08)
```

## Dependencies

- `01-mathml-delegation.md` — MathML wrapper location
- `03-namespace-coupling.md` — base types directory structure
- `04-register-versioning.md` — versioned subdirectories

## TODO Checklist

- [x] Document Moxml monkey-patch with rationale (removed entirely — upstream fix in moxml aa58888)
- [x] Audit autoload entries for alphabetical order
- [x] After refactoring: remove orphaned files (deleted content_groups dead code)
- [ ] After refactoring: verify no implicit load-order deps
- [x] After refactoring: clean up unused requires
- [x] Verify `bundle exec rake` passes cleanly
