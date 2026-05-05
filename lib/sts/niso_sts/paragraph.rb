# frozen_string_literal: true

module Sts
  module NisoSts
    class Paragraph < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :style_type, :string
      attribute :specific_use, :string
      attribute :text, :string, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :uri, ::Sts::NisoSts::Uri, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample,
                collection: true
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :disp_formula, ::Sts::NisoSts::DisplayFormula, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :sc, ::Sts::NisoSts::Sc, collection: true
      attribute :monospace, ::Sts::NisoSts::Monospace, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true
      attribute :break, ::Sts::NisoSts::Break, collection: true
      attribute :fn, ::Sts::NisoSts::Fn, collection: true
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :preformat, ::Sts::NisoSts::Preformat, collection: true
      attribute :array, ::Sts::NisoSts::SectionArray, collection: true
      attribute :overline, ::Sts::NisoSts::Overline, collection: true

      xml do
        element "p"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "style-type", to: :style_type
        map_attribute "specific-use", to: :specific_use
        map_content to: :text
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "styled-content", to: :styled_content
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "inline-formula", to: :inline_formula
        map_element "disp-formula", to: :disp_formula
        map_element "ext-link", to: :ext_link
        map_element "entailedTerm", to: :entailed_term
        map_element "uri", to: :uri
        map_element "std", to: :std
        map_element "xref", to: :xref
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "sc", to: :sc
        map_element "monospace", to: :monospace
        map_element "underline", to: :underline
        map_element "break", to: :break
        map_element "fn", to: :fn
        map_element "graphic", to: :graphic
        map_element "preformat", to: :preformat
        map_element "array", to: :array
        map_element "overline", to: :overline
      end
    end
  end
end
