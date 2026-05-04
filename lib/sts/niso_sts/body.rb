# frozen_string_literal: true

module Sts
  module NisoSts
    class Body < Lutaml::Model::Serializable
      attribute :sec, ::Sts::NisoSts::Section, collection: true
      attribute :term_sec, ::Sts::NisoSts::TermSection, collection: true
      attribute :paragraph, ::Sts::NisoSts::Paragraph, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true
      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap, collection: true
      attribute :fig, ::Sts::NisoSts::Figure, collection: true
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample,
                collection: true
      attribute :preformat, ::Sts::NisoSts::Preformat, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :array, ::Sts::NisoSts::SectionArray, collection: true
      attribute :disp_formula, ::Sts::NisoSts::DisplayFormula, collection: true
      attribute :disp_formula_group, ::Sts::NisoSts::DispFormulaGroup,
                collection: true
      attribute :editing_instruction, ::Sts::NisoSts::EditingInstruction,
                collection: true
      attribute :disp_quote, ::Sts::NisoSts::DispQuote, collection: true

      xml do
        element "body"
        ordered

        map_element "sec", to: :sec
        map_element "term-sec", to: :term_sec
        map_element "p", to: :paragraph
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "table-wrap", to: :table_wrap
        map_element "fig", to: :fig
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "preformat", to: :preformat
        map_element "styled-content", to: :styled_content
        map_element "array", to: :array
        map_element "disp-formula", to: :disp_formula
        map_element "disp-formula-group", to: :disp_formula_group
        map_element "editing-instruction", to: :editing_instruction
        map_element "disp-quote", to: :disp_quote
      end
    end
  end
end
