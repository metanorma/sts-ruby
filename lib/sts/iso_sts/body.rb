# frozen_string_literal: true

module Sts
  module IsoSts
    class Body < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :sec, ::Sts::IsoSts::Sec, collection: true
      attribute :term_sec, ::Sts::IsoSts::TermSec, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :disp_formula, ::Sts::IsoSts::DispFormula, collection: true
      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap, collection: true
      attribute :fig, ::Sts::IsoSts::Fig, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample,
                collection: true
      attribute :preformat, ::Sts::IsoSts::Preformat, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :array, ::Sts::IsoSts::Array, collection: true
      attribute :ref_list, ::Sts::IsoSts::RefList, collection: true
      attribute :disp_quote, ::Sts::NisoSts::DispQuote, collection: true
      attribute :editing_instruction, ::Sts::NisoSts::EditingInstruction,
                collection: true

      xml do
        element "body"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type

        map_element "p", to: :paragraph
        map_element "sec", to: :sec
        map_element "term-sec", to: :term_sec
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "disp-formula", to: :disp_formula
        map_element "table-wrap", to: :table_wrap
        map_element "fig", to: :fig
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "preformat", to: :preformat
        map_element "styled-content", to: :styled_content
        map_element "array", to: :array
        map_element "ref-list", to: :ref_list
        map_element "disp-quote", to: :disp_quote
        map_element "editing-instruction", to: :editing_instruction
      end
    end
  end
end
