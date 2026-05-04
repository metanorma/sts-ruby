# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Term < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :script, :string
      attribute :value, :string, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :math, ::Sts::TbxIsoTml::Math, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true

      xml do
        element "term"
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "id", to: :id
        map_attribute "script", to: :script
        map_element "inline-formula", to: :inline_formula
        map_element "italic", to: :italic
        map_element "bold", to: :bold
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "xref", to: :xref
        map_element "math", to: :math
        map_element "std", to: :std
        map_content to: :value
      end
    end
  end
end
