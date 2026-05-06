# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Td < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :align, :string
      attribute :scope, :string
      attribute :style, :string
      attribute :content_type, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :colspan, :string
      attribute :rowspan, :string
      attribute :valign, :string
      attribute :abbr, :string
      attribute :axis, :string
      attribute :headers, :string
      attribute :id, :string

      # block-math.class
      attribute :disp_formula, ::Sts::NisoSts::DisplayFormula,
                collection: true
      attribute :disp_formula_group, ::Sts::NisoSts::DispFormulaGroup,
                collection: true

      # citation.class
      attribute :element_citation, ::Sts::NisoSts::ElementCitation,
                collection: true
      attribute :mixed_citation, ::Sts::NisoSts::MixedCitation,
                collection: true

      # emphasis.class
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :monospace, ::Sts::NisoSts::Monospace, collection: true
      attribute :overline, ::Sts::NisoSts::Overline, collection: true
      attribute :roman, ::Sts::NisoSts::Roman, collection: true
      attribute :sc, ::Sts::NisoSts::Sc, collection: true
      attribute :strike, ::Sts::NisoSts::Strike, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true

      # figures.class
      attribute :fig, ::Sts::NisoSts::Figure, collection: true
      attribute :fig_group, ::Sts::NisoSts::FigGroup, collection: true

      # inline-display-noalt.class
      attribute :inline_graphic, ::Sts::NisoSts::InlineGraphic,
                collection: true
      attribute :private_char, ::Sts::NisoSts::PrivateChar,
                collection: true

      # inline-math.class
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula,
                collection: true

      # list.class
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true

      # all-notes.class
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :normative_note, ::Sts::NisoSts::NormativeNote,
                collection: true
      attribute :non_normative_example,
                ::Sts::NisoSts::NonNormativeExample, collection: true
      attribute :normative_example, ::Sts::NisoSts::NormativeExample,
                collection: true

      # nothing-but-para.class
      attribute :paragraph, ::Sts::NisoSts::Paragraph, collection: true

      # address-link.class
      attribute :email, ::Sts::NisoSts::Email, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :uri, ::Sts::NisoSts::Uri, collection: true

      # phrase.class
      attribute :named_content, ::Sts::NisoSts::NamedContent,
                collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent,
                collection: true

      # simple-display.class
      attribute :alternatives, ::Sts::NisoSts::Alternatives, collection: true
      attribute :array, ::Sts::IsoSts::Array, collection: true
      attribute :code, ::Sts::NisoSts::Code, collection: true
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :media, ::Sts::NisoSts::Media, collection: true
      attribute :preformat, ::Sts::NisoSts::Preformat, collection: true

      # simple-link.class
      attribute :fn, ::Sts::TbxIsoTml::Fn, collection: true
      attribute :target, ::Sts::NisoSts::Target, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true

      # subsup.class (already in emphasis)
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true

      # break.class
      attribute :break, ::Sts::TbxIsoTml::TableBreak

      # citation.class (std)
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true

      xml do # rubocop:disable Metrics/BlockLength
        element "td"
        mixed_content

        map_content to: :content

        map_attribute "align", to: :align
        map_attribute "scope", to: :scope
        map_attribute "style", to: :style
        map_attribute "content-type", to: :content_type
        map_attribute "char", to: :char, value_map: { to: { empty: :empty } }
        map_attribute "charoff", to: :charoff
        map_attribute "colspan", to: :colspan
        map_attribute "rowspan", to: :rowspan
        map_attribute "valign", to: :valign
        map_attribute "abbr", to: :abbr
        map_attribute "axis", to: :axis
        map_attribute "headers", to: :headers
        map_attribute "id", to: :id

        map_element "disp-formula", to: :disp_formula
        map_element "disp-formula-group", to: :disp_formula_group
        map_element "element-citation", to: :element_citation
        map_element "mixed-citation", to: :mixed_citation
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "monospace", to: :monospace
        map_element "overline", to: :overline
        map_element "roman", to: :roman
        map_element "sc", to: :sc
        map_element "strike", to: :strike
        map_element "underline", to: :underline
        map_element "fig", to: :fig
        map_element "fig-group", to: :fig_group
        map_element "inline-graphic", to: :inline_graphic
        map_element "private-char", to: :private_char
        map_element "inline-formula", to: :inline_formula
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "non-normative-note", to: :non_normative_note
        map_element "normative-note", to: :normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "normative-example", to: :normative_example
        map_element "p", to: :paragraph
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "alternatives", to: :alternatives
        map_element "array", to: :array
        map_element "code", to: :code
        map_element "graphic", to: :graphic
        map_element "media", to: :media
        map_element "preformat", to: :preformat
        map_element "fn", to: :fn
        map_element "target", to: :target
        map_element "xref", to: :xref
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "break", to: :break
        map_element "std", to: :std
      end
    end
  end
end
