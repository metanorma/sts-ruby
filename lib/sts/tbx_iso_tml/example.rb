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
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :monospace, ::Sts::NisoSts::Monospace, collection: true
      attribute :sc, ::Sts::NisoSts::Sc, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :break, ::Sts::NisoSts::Break, collection: true

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
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "monospace", to: :monospace
        map_element "sc", to: :sc
        map_element "ext-link", to: :ext_link
        map_element "styled-content", to: :styled_content
        map_element "break", to: :break
      end
    end
  end
end
