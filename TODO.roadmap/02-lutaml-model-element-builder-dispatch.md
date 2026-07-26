# A.02: lutaml-model `ElementBuilder` dispatch on `value.class`

**Status**: BUGREPORT drafted; analysis complete. Deferred per downstream
maintainer feedback (2026-07-25) — see "Why deferred" below.
**Repo**: `lutaml/lutaml-model`
**Estimated effort**: small (lutaml-model: ~10 lines + spec)

## Problem

`Lutaml::Xml::TransformationSupport::ElementBuilder#create_nested_model_element`
(lib/lutaml/xml/transformation/element_builder.rb:131) reuses the rule's
cached `child_transformation` for serialization regardless of the value's
actual class. When a caller assigns a `Lutaml::Model::Serializable` whose
class differs from the declared `attribute_type`, the wrong transformation
is applied silently:

- The declared type's `compiled_rules` are iterated
- `extract_rule_value` (rule_applier.rb:252) calls
  `model_instance.public_send(rule.attribute_name)` on the value
- If the value's class doesn't have that attribute name (e.g., declared type
  uses `:paragraph`, value's class uses `:p`), it raises `NoMethodError`

The cache itself is correct: `TransformationRegistry#transformation_key`
(lib/lutaml/model/transformation_registry.rb:218) includes `object_id`, so
keys are unique per class. The bug is in the dispatch logic, not the cache.

## Real-world trigger

The original sts-ruby report (PR #47): `Sts::TbxIsoTml::Fn` (Ruby attr
`:p`) was nested inside `Sts::NisoSts::Back` (whose `:fn_group` is typed
`NisoSts::FnGroup`, whose `:fn` is typed `NisoSts::Fn` with attr
`:paragraph`). lutaml-model applied the cached
`NisoSts::Fn`-transformation to the `TbxIsoTml::Fn` value, calling
`fn.public_send(:paragraph)` and raising.

## Why deferred

Downstream metanorma-iso maintainer feedback: "introduces a new contract
that may break other downstream consumers who've been quietly relying on
the current lenient behavior. Worth doing eventually, but urgency drops
once #1 lands — without the duplicate classes there's no easy way to
trigger the trap."

After PR #47 (delete TbxIsoTml::Fn/FnGroup), the trap cannot fire through
sts-ruby's own classes. The fix is still correct and worth doing, just not
urgent.

## Proposed lutaml-model fix

In `create_nested_model_element`, dispatch on `value.class` whenever value
is a `Serializable` that differs from the declared `attribute_type`:

```ruby
dispatch_on_value_class = union || is_polymorphic ||
  (value.is_a?(Lutaml::Model::Serialize) &&
   value.class != rule.attribute_type)

child_transformation = if dispatch_on_value_class
                         value.class.transformation_for(:xml, register)
                       else
                         rule.child_transformation ||
                           rule.attribute_type.transformation_for(:xml, register)
                       end
```

This subsumes the existing `is_polymorphic_subtype` branch (subtypes already
have `value.class != rule.attribute_type`). The fast path
(`value.class == rule.attribute_type`) preserves the cached
`rule.child_transformation` lookup, so no performance regression for the
common case.

## Files

- `BUGREPORT.element-builder-dispatch-on-value-class.md` in
  `~/src/lutaml/lutaml-model/`
- lutaml-model spec: `spec/lutaml/model/cross_class_dispatch_spec.rb` — three
  examples minimum (unrelated Serializable dispatch, round-trip preserved,
  declared-type fast path unchanged)

## Verification

- Reproduction case (currently raises in 0.8.18):

  ```ruby
  class ParentClass < Lutaml::Model::Serializable; end
  class OtherSerializable < Lutaml::Model::Serializable
    attribute :name, :string
    xml do
      element "other"
      map_element "name", to: :name
    end
  end
  class Holder < Lutaml::Model::Serializable
    attribute :child, ParentClass
    xml do
      map_element "child", to: :child
    end
  end

  h = Holder.new
  h.child = OtherSerializable.new(name: "x")
  h.to_xml  # currently: NoMethodError on ParentClass's :name
  # after fix: serialises using OtherSerializable's mapping
  ```

## How to apply

1. File BUGREPORT in `~/src/lutaml/lutaml-model/`.
2. Pair with the existing polymorphic specs (`spec/lutaml/model/polymorphic_spec.rb`)
   to ensure no regression on subtype dispatch.
3. Open upstream PR with the fix sketch above.

Revisit when: (a) a second cross-class case emerges anywhere in the
metanorma fleet, or (b) the next lutaml-model major release (good time to
tighten contracts).
