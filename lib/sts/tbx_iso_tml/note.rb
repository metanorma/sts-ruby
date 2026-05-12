# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Note < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :value, :string, collection: true
      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :math, ::Sts::TbxIsoTml::Math, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :sup, ::Sts::TbxIsoTml::Sup, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true

      xml do
        element "note"
        namespace ::Sts::Namespaces::TbxNamespace
        mixed_content

        map_attribute "id", to: :id
        map_content to: :value
        map_element "entailedTerm", to: :entailed_term
        map_element "list", to: :list
        map_element "table-wrap", to: :table_wrap
        map_element "std", to: :std
        map_element "sup", to: :sup
        map_element "sub", to: :sub
        map_element "italic", to: :italic
        map_element "bold", to: :bold
        map_element "xref", to: :xref
        map_element "math", to: :math
        map_element "inline-formula", to: :inline_formula
      end
    end
  end
end
