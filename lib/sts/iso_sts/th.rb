# frozen_string_literal: true

module Sts
  module IsoSts
    class Th < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :style, :string
      attribute :abbr, :string
      attribute :axis, :string
      attribute :headers, :string
      attribute :scope, :string
      attribute :rowspan, :string
      attribute :colspan, :string
      attribute :align, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :valign, :string
      attribute :content, :string, collection: true
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :fig, ::Sts::IsoSts::Fig, collection: true
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :disp_formula, ::Sts::IsoSts::DispFormula, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :math, ::Sts::IsoSts::Mathml2::Math, collection: true
      attribute :std, ::Sts::IsoSts::Std, collection: true
      attribute :fn, ::Sts::TbxIsoTml::Fn, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote, collection: true
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true

      xml do # rubocop:disable Metrics/BlockLength
        element "th"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "style", to: :style
        map_attribute "abbr", to: :abbr
        map_attribute "axis", to: :axis
        map_attribute "headers", to: :headers
        map_attribute "scope", to: :scope
        map_attribute "rowspan", to: :rowspan
        map_attribute "colspan", to: :colspan
        map_attribute "align", to: :align
        map_attribute "char", to: :char
        map_attribute "charoff", to: :charoff
        map_attribute "valign", to: :valign

        map_content to: :content

        map_element "p", to: :paragraph
        map_element "fig", to: :fig
        map_element "graphic", to: :graphic
        map_element "disp-formula", to: :disp_formula
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "math", to: :math
        map_element "std", to: :std
        map_element "fn", to: :fn
        map_element "xref", to: :xref
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "styled-content", to: :styled_content
      end
    end
  end
end
