# 06: lutaml-model `ElementBuilder#create_nested_model_element` dispatch fix

**Status**: DEFERRED (per downstream maintainer feedback 2026-07-25)
**Repo**: `lutaml/lutaml-model`
**File**: `lib/lutaml/xml/transformation/element_builder.rb`

## Why deferred

The downstream metanorma-iso maintainer (who originally reported the bug) reviewed the proposed two-PR plan and recommended:

> Defer #2. The fix is a real robustness win but introduces a new contract
> ("declared type must match value class") that may break other downstream
> consumers who've been quietly relying on the current lenient behavior. Worth
> doing eventually, but the urgency drops once #1 lands — without the
> duplicate classes there's no easy way to trigger the trap.

## Original analysis (kept for future reference)

Currently `create_nested_model_element` reuses `rule.child_transformation` (compiled for the declared `attribute_type`) for any value that is not a declared subtype. When a caller assigns an unrelated `Lutaml::Model::Serialize` to a typed slot, the wrong transformation is applied to the value, producing confusing `NoMethodError`s on whichever Ruby attribute name differs.

The cache itself is fine — `transformation_key` includes `object_id`. The dispatch logic is the bug.

## When to revisit

- Track upstream consumers: if a second case of cross-class assignment emerges (e.g., another gem duplicates a Serializable with different Ruby attribute names), the urgency rises.
- Pair with a proper audit of existing polymorphic specs to ensure the lenient dispatch wouldn't break tests.
- Consider an opt-in flag (`strict_type_check: true`) before flipping default behavior.

## Sketch of the fix (when revisited)

In `lib/lutaml/xml/transformation/element_builder.rb#create_nested_model_element`:

```ruby
dispatch_on_value_class = union || is_polymorphic ||
  (value.is_a?(Lutaml::Model::Serialize) && value.class != rule.attribute_type)

child_transformation = if dispatch_on_value_class
                         value.class.transformation_for(:xml, register)
                       else
                         rule.child_transformation ||
                           rule.attribute_type.transformation_for(:xml, register)
                       end
```

This subsumes the existing `is_polymorphic_subtype` check (subtypes already have `value.class != rule.attribute_type`).
