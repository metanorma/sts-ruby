# frozen_string_literal: true

require "lutaml/model"

# Moxml strips whitespace-only text nodes between elements in its Nokogiri
# adapter's `children` method. This breaks mixed content round-tripping where
# spaces between inline elements are significant (e.g., "<b>A</b> <b>B</b>").
# Override to preserve all text nodes.
Moxml::Adapter::Nokogiri.singleton_class.alias_method(:_orig_children, :children)
Moxml::Adapter::Nokogiri.define_singleton_method(:children) do |node|
  node.children
end

module Sts
  autoload :ContentGroups, "#{__dir__}/sts/content_groups/helpers"
  autoload :EnumValues, "#{__dir__}/sts/enum_values"
  autoload :IsoSts, "#{__dir__}/sts/iso_sts"
  autoload :Mathml, "#{__dir__}/sts/mathml"
  autoload :Namespaces, "#{__dir__}/sts/namespaces"
  autoload :NisoSts, "#{__dir__}/sts/niso_sts"
  autoload :VERSION, "#{__dir__}/sts/version"
  autoload :TbxIsoTml, "#{__dir__}/sts/tbx_iso_tml"
end
