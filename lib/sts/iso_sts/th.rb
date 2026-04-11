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
      attribute :content, :string
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :fig, ::Sts::IsoSts::Fig
      attribute :graphic, ::Sts::IsoSts::Graphic
      attribute :disp_formula, ::Sts::IsoSts::DispFormula
      attribute :list, ::Sts::IsoSts::List
      attribute :def_list, ::Sts::IsoSts::DefList
      attribute :math, ::Sts::IsoSts::Mathml2::Math
      attribute :std, ::Sts::IsoSts::Std
      attribute :fn, ::Sts::TbxIsoTml::Fn
      attribute :xref, ::Sts::TbxIsoTml::Xref
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample
      attribute :styled_content, ::Sts::IsoSts::StyledContent

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
