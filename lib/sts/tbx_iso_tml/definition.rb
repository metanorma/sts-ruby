# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Definition < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :note, ::Sts::TbxIsoTml::Note
      attribute :value, :string, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :math, ::Sts::TbxIsoTml::Math
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :monospace, ::Sts::NisoSts::Monospace, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true

      xml do
        element "definition"
        map_attribute "id", to: :id
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_content to: :value
        map_element "entailedTerm", to: :entailed_term
        map_element "note", to: :note
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "list", to: :list
        map_element "std", to: :std
        map_element "math", to: :math
        map_element "xref", to: :xref
        map_element "inline-formula", to: :inline_formula
        map_element "bold", to: :bold
        map_element "monospace", to: :monospace
        map_element "ext-link", to: :ext_link
        map_element "styled-content", to: :styled_content
      end
    end
  end
end
