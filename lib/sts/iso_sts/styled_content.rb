# frozen_string_literal: true

module Sts
  module IsoSts
    class StyledContent < Lutaml::Model::Serializable
      attribute :style, :string
      attribute :style_type, :string
      attribute :alt, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :sub, ::Sts::NisoSts::Sub
      attribute :sup, ::Sts::NisoSts::Sup
      attribute :xref, ::Sts::TbxIsoTml::Xref
      attribute :ext_link, ::Sts::NisoSts::ExtLink
      attribute :uri, ::Sts::NisoSts::Uri
      attribute :inline_formula, ::Sts::IsoSts::InlineFormula
      attribute :disp_formula, ::Sts::IsoSts::DispFormula
      attribute :std, ::Sts::IsoSts::Std
      attribute :named_content, ::Sts::NisoSts::NamedContent
      attribute :monospace, ::Sts::NisoSts::Monospace
      attribute :sc, ::Sts::NisoSts::Sc
      attribute :strike, ::Sts::NisoSts::Strike
      attribute :underline, ::Sts::NisoSts::Underline
      attribute :ruby, ::Sts::NisoSts::Ruby
      attribute :break, ::Sts::IsoSts::Break

      xml do
        element "styled-content"
        mixed_content

        map_attribute "style", to: :style
        map_attribute "style-type", to: :style_type
        map_attribute "alt", to: :alt
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_content to: :content

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "xref", to: :xref
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "inline-formula", to: :inline_formula
        map_element "disp-formula", to: :disp_formula
        map_element "std", to: :std
        map_element "named-content", to: :named_content
        map_element "monospace", to: :monospace
        map_element "sc", to: :sc
        map_element "strike", to: :strike
        map_element "underline", to: :underline
        map_element "ruby", to: :ruby
        map_element "break", to: :break
      end
    end
  end
end
