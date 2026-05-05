# frozen_string_literal: true

module Sts
  module IsoSts
    class Paragraph < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :originator, :string
      attribute :style_type, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :uri, ::Sts::NisoSts::Uri, collection: true
      attribute :inline_formula, ::Sts::IsoSts::InlineFormula, collection: true
      attribute :disp_formula, ::Sts::IsoSts::DispFormula, collection: true
      attribute :std, ::Sts::IsoSts::Std, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample,
                collection: true
      attribute :fn, ::Sts::TbxIsoTml::Fn, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :math, ::Sts::IsoSts::Mathml2::Math, collection: true
      attribute :break, ::Sts::IsoSts::Break, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :monospace, ::Sts::NisoSts::Monospace, collection: true
      attribute :sc, ::Sts::NisoSts::Sc, collection: true
      attribute :strike, ::Sts::NisoSts::Strike, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true
      attribute :array, ::Sts::IsoSts::Array, collection: true
      attribute :fig, ::Sts::IsoSts::Fig, collection: true
      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap, collection: true
      attribute :preformat, ::Sts::IsoSts::Preformat, collection: true
      attribute :term, ::Sts::TbxIsoTml::Term, collection: true

      xml do # rubocop:disable Metrics/BlockLength
        element "p"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "originator", to: :originator
        map_attribute "style-type", to: :style_type

        map_content to: :content

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "xref", to: :xref
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "inline-formula", to: :inline_formula
        map_element "disp-formula", to: :disp_formula
        map_element "std", to: :std
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "fn", to: :fn
        map_element "styled-content", to: :styled_content
        map_element "graphic", to: :graphic
        map_element "math", to: :math
        map_element "break", to: :break
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "monospace", to: :monospace
        map_element "sc", to: :sc
        map_element "strike", to: :strike
        map_element "underline", to: :underline
        map_element "array", to: :array
        map_element "fig", to: :fig
        map_element "table-wrap", to: :table_wrap
        map_element "preformat", to: :preformat
        map_element "term", to: :term
      end
    end
  end
end
