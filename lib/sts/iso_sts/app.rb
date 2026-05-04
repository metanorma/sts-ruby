# frozen_string_literal: true

module Sts
  module IsoSts
    class App < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :annex_type, ::Sts::IsoSts::AnnexType
      attribute :title, ::Sts::IsoSts::Title
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :sec, ::Sts::IsoSts::Sec, collection: true
      attribute :term_sec, ::Sts::IsoSts::TermSec, collection: true
      attribute :fn_group, ::Sts::IsoSts::FnGroup, collection: true
      attribute :ref_list, ::Sts::IsoSts::RefList, collection: true
      attribute :permissions, ::Sts::NisoSts::Permissions
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample,
                collection: true
      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :fig, ::Sts::IsoSts::Fig, collection: true
      attribute :array, ::Sts::IsoSts::Array, collection: true
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :preformat, ::Sts::IsoSts::Preformat, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :disp_formula, ::Sts::IsoSts::DispFormula, collection: true
      attribute :inline_formula, ::Sts::IsoSts::InlineFormula, collection: true

      xml do
        element "app"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "label", to: :label
        map_element "annex-type", to: :annex_type
        map_element "title", to: :title
        map_element "p", to: :paragraph
        map_element "sec", to: :sec
        map_element "term-sec", to: :term_sec
        map_element "fn-group", to: :fn_group
        map_element "ref-list", to: :ref_list
        map_element "permissions", to: :permissions
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "table-wrap", to: :table_wrap
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "fig", to: :fig
        map_element "array", to: :array
        map_element "graphic", to: :graphic
        map_element "preformat", to: :preformat
        map_element "styled-content", to: :styled_content
        map_element "disp-formula", to: :disp_formula
        map_element "inline-formula", to: :inline_formula
      end
    end
  end
end
