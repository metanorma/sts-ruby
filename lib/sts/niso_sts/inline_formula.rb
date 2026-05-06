# frozen_string_literal: true

module Sts
  module NisoSts
    class InlineFormula < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :inline_graphic, ::Sts::NisoSts::InlineGraphic, collection: true
      attribute :private_char, ::Sts::NisoSts::PrivateChar, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :math, ::Sts::TbxIsoTml::Math
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :alternatives, ::Sts::NisoSts::Alternatives
      attribute :preformat, ::Sts::NisoSts::Preformat
      attribute :alt_text, ::Sts::NisoSts::AltText
      attribute :long_desc, ::Sts::NisoSts::LongDesc

      xml do
        element "inline-formula"
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "inline-graphic", to: :inline_graphic
        map_element "private-char", to: :private_char
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "math", to: :math
        map_element "inline-formula", to: :inline_formula
        map_element "alternatives", to: :alternatives
        map_element "preformat", to: :preformat
        map_element "alt-text", to: :alt_text
        map_element "long-desc", to: :long_desc
      end
    end
  end
end
