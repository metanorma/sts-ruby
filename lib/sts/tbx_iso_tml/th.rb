# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Th < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :colspan, :string
      attribute :align, :string
      attribute :scope, :string
      attribute :style, :string
      attribute :rowspan, :string
      attribute :break, ::Sts::TbxIsoTml::TableBreak
      attribute :content_type, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :valign, :string
      attribute :abbr, :string
      attribute :axis, :string
      attribute :headers, :string
      attribute :id, :string
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :paragraph, ::Sts::NisoSts::Paragraph, collection: true
      attribute :fn, ::Sts::TbxIsoTml::Fn, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true
      attribute :monospace, ::Sts::NisoSts::Monospace, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true
      attribute :break, ::Sts::TbxIsoTml::TableBreak

      xml do
        element "th"
        mixed_content

        map_content to: :content
        map_attribute "colspan", to: :colspan
        map_attribute "align", to: :align
        map_attribute "scope", to: :scope
        map_attribute "style", to: :style
        map_attribute "rowspan", to: :rowspan
        map_attribute "content-type", to: :content_type
        map_attribute "char", to: :char, value_map: { to: { empty: :empty } }
        map_attribute "charoff", to: :charoff
        map_attribute "valign", to: :valign
        map_attribute "abbr", to: :abbr
        map_attribute "axis", to: :axis
        map_attribute "headers", to: :headers
        map_attribute "id", to: :id

        map_element "break", to: :break
        map_element "italic", to: :italic
        map_element "bold", to: :bold
        map_element "std", to: :std
        map_element "xref", to: :xref
        map_element "inline-formula", to: :inline_formula
        map_element "p", to: :paragraph
        map_element "fn", to: :fn
        map_element "styled-content", to: :styled_content
        map_element "underline", to: :underline
        map_element "monospace", to: :monospace
        map_element "sup", to: :sup
        map_element "sub", to: :sub
        map_element "graphic", to: :graphic
        map_element "list", to: :list
        map_element "non-normative-note", to: :non_normative_note
        map_element "def-list", to: :def_list
        map_element "break", to: :break
      end
    end
  end
end
