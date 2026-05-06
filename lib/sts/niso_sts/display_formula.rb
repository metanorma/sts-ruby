# frozen_string_literal: true

module Sts
  module NisoSts
    class DisplayFormula < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :originator, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :break_, ::Sts::NisoSts::Break, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :inline_graphic, ::Sts::NisoSts::InlineGraphic, collection: true
      attribute :private_char, ::Sts::NisoSts::PrivateChar, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :label, ::Sts::NisoSts::Label
      attribute :math, ::Sts::TbxIsoTml::Math
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :tex_math, ::Sts::NisoSts::TexMath
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :alternatives, ::Sts::NisoSts::Alternatives
      attribute :caption, ::Sts::NisoSts::Caption
      attribute :fn, ::Sts::NisoSts::Fn, collection: true
      attribute :target, ::Sts::NisoSts::Target, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true

      xml do
        element "disp-formula"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "originator", to: :originator
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "break", to: :break_
        map_element "ext-link", to: :ext_link
        map_element "inline-graphic", to: :inline_graphic
        map_element "private-char", to: :private_char
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "label", to: :label
        map_element "math", to: :math
        map_element "inline-formula", to: :inline_formula
        map_element "tex-math", to: :tex_math
        map_element "graphic", to: :graphic
        map_element "alternatives", to: :alternatives
        map_element "caption", to: :caption
        map_element "fn", to: :fn
        map_element "target", to: :target
        map_element "xref", to: :xref
      end
    end
  end
end
