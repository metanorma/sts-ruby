# frozen_string_literal: true

require "spec_helper"

# Global rules (see CLAUDE.md): the patterns checked below are forbidden in
# lib/. They either break encapsulation (send, instance_variable_set/get),
# hide type errors (respond_to? for type checks), bypass the framework's
# type system (hand-rolled to_* / from_* on Serializable subclasses), or
# violate lazy-loading (require_relative in lib code).
#
# Allowlist: `respond_to?(:read)` is the only IO-vs-String duck-type check
# permitted, and only at gem boundaries (none currently in lib/). Add to
# ALLOWEDRespondToUses if a real boundary case emerges.
RSpec.describe "Anti-patterns" do
  lib_dir = File.expand_path("../lib", __dir__)
  rb_files = Dir.glob(File.join(lib_dir, "**", "*.rb"))

  before do
    # Hand-rolled serialization methods break lutaml-model's type system. The
    # framework generates correct (de)serialisation from `attribute` + `mapping`
    # declarations; hand-rolled versions bypass attribute types, defaults, and
    # drift silently as the model evolves.
    stub_const(
      "HAND_ROLLED_SERIALIZATION",
      %w[
        to_h to_hash from_h from_hash to_json from_json serialize deserialize
        to_xml from_xml
      ],
    )
    # respond_to? at gem boundaries (IO vs String) is occasionally legitimate;
    # allowlist such cases here.
    stub_const("ALLOWED_RESPOND_TO_USES", [])
  end

  rb_files.each do |path|
    rel = path.sub("#{lib_dir}/", "")
    source = File.read(path)

    describe rel do
      it "has no method_missing" do
        msg = "#{rel}: method_missing forbidden"
        expect(source).not_to include("method_missing"), msg
      end

      it "has no respond_to_missing?" do
        msg = "#{rel}: respond_to_missing? forbidden"
        expect(source).not_to include("respond_to_missing?"), msg
      end

      it "has no Object.const_get" do
        msg = "#{rel}: Object.const_get forbidden"
        expect(source).not_to include("Object.const_get"), msg
      end

      it "has no .send()" do
        msg = "#{rel}: .send() forbidden"
        expect(source).not_to include(".send("), msg
      end

      it "has no instance_variable_set or instance_variable_get" do
        msg = "#{rel}: instance_variable_set/get forbidden " \
              "(breaks encapsulation)"
        expect(source).not_to match(/instance_variable_(set|get)/), msg
      end

      it "has no respond_to? type-checks" do
        # respond_to? at gem boundaries (IO vs String) is occasionally
        # legitimate; allowlist such cases in ALLOWED_RESPOND_TO_USES.
        pattern = /respond_to\(\?:[^)\s]+\)/
        matches = source.scan(pattern).map { |m| m&.first || m }
        violations = matches - ALLOWED_RESPOND_TO_USES
        msg = "#{rel}: respond_to? type-checks forbidden " \
              "(use is_a?); found #{violations.inspect}"
        expect(violations).to be_empty, msg
      end

      it "has no hand-rolled serialization methods" do
        # Catches `def to_xml(*)`, `def from_xml(input)`, etc. on Serializable
        # subclasses. The framework provides these; hand-rolled versions
        # bypass attribute types and mappings.
        violations = HAND_ROLLED_SERIALIZATION.select do |method|
          source.match?(/^\s*def\s+#{method}\b/)
        end
        expect(violations).to be_empty,
                              "#{rel}: hand-rolled serialization forbidden " \
                              "(use lutaml-model attribute + mapping); " \
                              "found #{violations.inspect}"
      end

      it "has no require_relative" do
        msg = "#{rel}: require_relative forbidden in lib/ " \
              "(use autoload in the parent namespace)"
        expect(source).not_to include("require_relative"), msg
      end

      it "has no require with an internal library path" do
        # `require "lutaml/model"` (external gem) is fine.
        # `require "sts/iso_sts/foo"` (internal path) is not — use autoload.
        matches = source.scan(/^\s*require\s+["']([^"']+)["']/m)
        internal = matches.flatten.reject do |req|
          req.start_with?("lutaml", "mml", "moxml", "nokogiri",
                          "forwardable") ||
            req == "json" || req == "set"
        end
        msg = "#{rel}: internal require forbidden (use autoload); " \
              "found #{internal.inspect}"
        expect(internal).to be_empty, msg
      end
    end
  end
end
