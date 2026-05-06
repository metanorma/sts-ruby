# frozen_string_literal: true

module Sts
  module IsoSts
    class Label < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :sub, ::Sts::IsoSts::Sub
      attribute :sup, ::Sts::IsoSts::Sup
      attribute :inline_formula, ::Sts::IsoSts::InlineFormula
      attribute :break, ::Sts::IsoSts::Break
      attribute :styled_content, ::Sts::IsoSts::StyledContent
      attribute :ext_link, ::Sts::IsoSts::ExtLink
      attribute :uri, ::Sts::IsoSts::Uri
      attribute :named_content, ::Sts::IsoSts::NamedContent

      xml do
        element "label"
        map_attribute "id", to: :id
        mixed_content

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "inline-formula", to: :inline_formula
        map_element "break", to: :break
        map_element "styled-content", to: :styled_content
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "named-content", to: :named_content
      end
    end
  end
end
