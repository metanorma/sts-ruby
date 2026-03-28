# frozen_string_literal: true



module Sts
  module TbxIsoTml
    class Term < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :script, :string
      attribute :value, :string
      attribute :italic, ::Sts::TbxIsoTml::Italic
      attribute :bold, :string
      attribute :sub, :string
      attribute :math, ::Sts::TbxIsoTml::Math
      attribute :xref, ::Sts::TbxIsoTml::Xref
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true

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
        map_element "xref", to: :xref
        map_element "math", to: :math
        map_content to: :value
      end
    end
  end
end
