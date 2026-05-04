# frozen_string_literal: true

module Sts
  module NisoSts
    class Section < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, ::Sts::NisoSts::Title
      attribute :type, :string
      attribute :array, ::Sts::NisoSts::SectionArray
      attribute :paragraphs, ::Sts::NisoSts::Paragraph, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :term_sec, ::Sts::NisoSts::TermSection, collection: true
      attribute :ref_list, ::Sts::NisoSts::ReferenceList, collection: true
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample,
                collection: true
      attribute :sec, ::Sts::NisoSts::Section, collection: true
      attribute :fig, ::Sts::NisoSts::Figure, collection: true
      attribute :fig_group, ::Sts::NisoSts::FigGroup, collection: true

      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap, collection: true
      attribute :boxed_text, ::Sts::NisoSts::BoxedText, collection: true
      attribute :preformat, ::Sts::NisoSts::Preformat, collection: true
      attribute :disp_formula, ::Sts::NisoSts::DisplayFormula, collection: true
      attribute :disp_formula_group, ::Sts::NisoSts::DispFormulaGroup,
                collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :editing_instruction, ::Sts::NisoSts::EditingInstruction,
                collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :fn_group, ::Sts::NisoSts::FnGroup, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :disp_quote, ::Sts::NisoSts::DispQuote, collection: true
      attribute :chem_struct_wrap, ::Sts::NisoSts::ChemStructWrap,
                collection: true
      attribute :fn, ::Sts::NisoSts::Fn, collection: true

      xml do
        element "sec"
        ordered

        map_attribute "id", to: :id
        map_attribute "sec-type", to: :type
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label
        map_element "title", to: :title
        map_element "p", to: :paragraphs
        map_element "sec", to: :sec
        map_element "term-sec", to: :term_sec
        map_element "list", to: :list
        map_element "fig", to: :fig
        map_element "fig-group", to: :fig_group
        map_element "ref-list", to: :ref_list
        map_element "array", to: :array
        map_element "table-wrap", to: :table_wrap
        map_element "boxed-text", to: :boxed_text
        map_element "preformat", to: :preformat
        map_element "disp-formula", to: :disp_formula
        map_element "disp-formula-group", to: :disp_formula_group
        map_element "styled-content", to: :styled_content
        map_element "editing-instruction", to: :editing_instruction
        map_element "def-list", to: :def_list
        map_element "graphic", to: :graphic
        map_element "std", to: :std
        map_element "fn-group", to: :fn_group
        map_element "xref", to: :xref
        map_element "ext-link", to: :ext_link
        map_element "inline-formula", to: :inline_formula
        map_element "disp-quote", to: :disp_quote
        map_element "chem-struct-wrap", to: :chem_struct_wrap
        map_element "fn", to: :fn
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
      end
    end
  end
end
