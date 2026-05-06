# frozen_string_literal: true

module Sts
  module NisoSts
    class StyledContent < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :style, :string
      attribute :style_type, :string
      attribute :toggle, :string
      attribute :specific_use, :string
      attribute :lang, :string
      attribute :content, :string, collection: true
      attribute :uri, ::Sts::NisoSts::Uri, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :sc, ::Sts::NisoSts::Sc, collection: true
      attribute :monospace, ::Sts::NisoSts::Monospace, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :break, ::Sts::NisoSts::Break, collection: true
      attribute :fn, ::Sts::NisoSts::Fn, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent, collection: true
      attribute :target, ::Sts::NisoSts::Target, collection: true
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true

      xml do
        element "styled-content"
        map_attribute "id", to: :id
        mixed_content

        map_attribute "style", to: :style
        map_attribute "style-type", to: :style_type
        map_attribute "toggle", to: :toggle
        map_attribute "specific-use", to: :specific_use
        map_attribute "lang", to: :lang
        map_content to: :content
        map_element "uri", to: :uri
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "sc", to: :sc
        map_element "monospace", to: :monospace
        map_element "xref", to: :xref
        map_element "ext-link", to: :ext_link
        map_element "inline-formula", to: :inline_formula
        map_element "std", to: :std
        map_element "break", to: :break
        map_element "fn", to: :fn
        map_element "named-content", to: :named_content
        map_element "target", to: :target
        map_element "graphic", to: :graphic
        map_element "styled-content", to: :styled_content
        map_element "underline", to: :underline
      end
    end
  end
end
