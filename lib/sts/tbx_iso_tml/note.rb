# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Note < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :value, :string
      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :math, ::Sts::TbxIsoTml::Math, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref
      attribute :list, ::Sts::NisoSts::List
      attribute :std, ::Sts::NisoSts::ReferenceStandard
      attribute :sup, ::Sts::TbxIsoTml::Sup
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true

      xml do
        element "note"
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "id", to: :id
        map_content to: :value
        map_element "entailedTerm", to: :entailed_term
        map_element "list", to: :list
        map_element "table-wrap", to: :table_wrap
        map_element "std", to: :std
        map_element "sup", to: :sup
        map_element "italic", to: :italic
        map_element "xref", to: :xref
        map_element "math", to: :math
      end
    end
  end
end
