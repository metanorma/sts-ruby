# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Definition < Lutaml::Model::Serializable
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :note, ::Sts::TbxIsoTml::Note
      attribute :value, :string, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic
      attribute :math, ::Sts::TbxIsoTml::Math
      attribute :sub, :string
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true

      xml do
        element "definition"
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_content to: :value
        map_element "entailedTerm", to: :entailed_term
        map_element "note", to: :note
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "list", to: :list
        map_element "std", to: :std
        map_element "math", to: :math
      end
    end
  end
end
