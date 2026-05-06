# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Example < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :value, :string, collection: true
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true

      xml do
        element "example"
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_content to: :value

        map_attribute "id", to: :id

        map_element "entailedTerm", to: :entailed_term
        map_element "inline-formula", to: :inline_formula
        map_element "xref", to: :xref
        map_element "std", to: :std
        map_element "italic", to: :italic
        map_element "bold", to: :bold
      end
    end
  end
end
