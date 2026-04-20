# frozen_string_literal: true

module Sts
  module IsoSts
    class Bold < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :sub, ::Sts::NisoSts::Sub
      attribute :sup, ::Sts::NisoSts::Sup
      attribute :xref, ::Sts::TbxIsoTml::Xref
      attribute :ext_link, ::Sts::NisoSts::ExtLink
      attribute :uri, ::Sts::NisoSts::Uri
      attribute :inline_formula, ::Sts::IsoSts::InlineFormula
      attribute :named_content, ::Sts::NisoSts::NamedContent
      attribute :styled_content, ::Sts::IsoSts::StyledContent
      attribute :break, ::Sts::IsoSts::Break

      xml do
        element "bold"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use

        map_content to: :content

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "xref", to: :xref
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "inline-formula", to: :inline_formula
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "break", to: :break
      end
    end
  end
end
