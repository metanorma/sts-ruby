# frozen_string_literal: true

module Sts
  module IsoSts
    class Bio < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :rid, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xlink_type, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :title, ::Sts::IsoSts::Title
      attribute :address, ::Sts::IsoSts::Address, collection: true
      attribute :alternatives, ::Sts::IsoSts::Alternatives, collection: true
      attribute :array, ::Sts::IsoSts::Array, collection: true
      attribute :boxed_text, ::Sts::IsoSts::BoxedText, collection: true
      attribute :chem_struct_wrap, ::Sts::IsoSts::ChemStructWrap,
                collection: true
      attribute :fig, ::Sts::IsoSts::Fig, collection: true
      attribute :fig_group, ::Sts::IsoSts::FigGroup, collection: true
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :media, ::Sts::IsoSts::Media, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample,
                collection: true
      attribute :preformat, ::Sts::IsoSts::Preformat, collection: true
      attribute :supplementary_material, ::Sts::IsoSts::SupplementaryMaterial,
                collection: true
      attribute :table_wrap, ::Sts::IsoSts::TableWrap, collection: true
      attribute :table_wrap_group, ::Sts::IsoSts::TableWrapGroup,
                collection: true
      attribute :disp_formula, ::Sts::IsoSts::DispFormula, collection: true
      attribute :disp_formula_group, ::Sts::IsoSts::DispFormulaGroup,
                collection: true
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :math, ::Mml::V2::Math, collection: true
      attribute :related_article, ::Sts::IsoSts::RelatedArticle,
                collection: true
      attribute :related_object, ::Sts::IsoSts::RelatedObject, collection: true
      attribute :disp_quote, ::Sts::IsoSts::DispQuote, collection: true
      attribute :speech, ::Sts::IsoSts::Speech, collection: true
      attribute :statement, ::Sts::IsoSts::Statement, collection: true
      attribute :verse_group, ::Sts::IsoSts::VerseGroup, collection: true
      attribute :sec, ::Sts::IsoSts::Sec, collection: true
      attribute :term_sec, ::Sts::IsoSts::TermSec, collection: true
      attribute :fn_group, ::Sts::IsoSts::FnGroup, collection: true
      attribute :glossary, ::Sts::IsoSts::Glossary, collection: true
      attribute :ref_list, ::Sts::IsoSts::RefList, collection: true

      xml do # rubocop:disable Metrics/BlockLength
        element "bio"
        ordered

        map_attribute "id", to: :id
        map_attribute "rid", to: :rid
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_element "label", to: :label
        map_element "title", to: :title
        map_element "address", to: :address
        map_element "alternatives", to: :alternatives
        map_element "array", to: :array
        map_element "boxed-text", to: :boxed_text
        map_element "chem-struct-wrap", to: :chem_struct_wrap
        map_element "fig", to: :fig
        map_element "fig-group", to: :fig_group
        map_element "graphic", to: :graphic
        map_element "media", to: :media
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "preformat", to: :preformat
        map_element "supplementary-material", to: :supplementary_material
        map_element "table-wrap", to: :table_wrap
        map_element "table-wrap-group", to: :table_wrap_group
        map_element "disp-formula", to: :disp_formula
        map_element "disp-formula-group", to: :disp_formula_group
        map_element "p", to: :paragraph
        map_element "def-list", to: :def_list
        map_element "list", to: :list
        map_element "math", to: :math
        map_element "related-article", to: :related_article
        map_element "related-object", to: :related_object
        map_element "disp-quote", to: :disp_quote
        map_element "speech", to: :speech
        map_element "statement", to: :statement
        map_element "verse-group", to: :verse_group
        map_element "sec", to: :sec
        map_element "term-sec", to: :term_sec
        map_element "fn-group", to: :fn_group
        map_element "glossary", to: :glossary
        map_element "ref-list", to: :ref_list
      end
    end
  end
end
