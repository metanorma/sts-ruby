# frozen_string_literal: true

module Sts
  module IsoSts
    class LicenseP < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :content, :string, collection: true
      attribute :email, ::Sts::IsoSts::Email, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :inline_supplementary_material, ::Sts::IsoSts::InlineSupplementaryMaterial,
                collection: true
      attribute :related_article, ::Sts::IsoSts::RelatedArticle,
                collection: true
      attribute :related_object, ::Sts::IsoSts::RelatedObject, collection: true
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
      attribute :element_citation, ::Sts::IsoSts::ElementCitation,
                collection: true
      attribute :mixed_citation, ::Sts::IsoSts::MixedCitation, collection: true
      attribute :std, ::Sts::IsoSts::Std, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :monospace, ::Sts::IsoSts::Monospace, collection: true
      attribute :num, ::Sts::IsoSts::Num, collection: true
      attribute :overline, ::Sts::IsoSts::Overline, collection: true
      attribute :roman, ::Sts::IsoSts::Roman, collection: true
      attribute :sans_serif, ::Sts::IsoSts::SansSerif, collection: true
      attribute :sc, ::Sts::IsoSts::Sc, collection: true
      attribute :strike, ::Sts::IsoSts::Strike, collection: true
      attribute :underline, ::Sts::IsoSts::Underline, collection: true
      attribute :award_id, ::Sts::IsoSts::AwardId, collection: true
      attribute :funding_source, ::Sts::IsoSts::FundingSource, collection: true
      attribute :open_access, ::Sts::IsoSts::OpenAccess, collection: true
      attribute :chem_struct, ::Sts::IsoSts::ChemStruct, collection: true
      attribute :inline_formula, ::Sts::IsoSts::InlineFormula, collection: true
      attribute :inline_graphic, ::Sts::IsoSts::InlineGraphic, collection: true
      attribute :private_char, ::Sts::IsoSts::PrivateChar, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :math, ::Mml::V2::Math, collection: true
      attribute :abbrev, ::Sts::IsoSts::Abbrev, collection: true
      attribute :milestone_end, ::Sts::IsoSts::MilestoneEnd, collection: true
      attribute :milestone_start, ::Sts::IsoSts::MilestoneStart,
                collection: true
      attribute :named_content, ::Sts::IsoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :disp_quote, ::Sts::IsoSts::DispQuote, collection: true
      attribute :speech, ::Sts::IsoSts::Speech, collection: true
      attribute :statement, ::Sts::IsoSts::Statement, collection: true
      attribute :verse_group, ::Sts::IsoSts::VerseGroup, collection: true
      attribute :fn, ::Sts::IsoSts::Fn, collection: true
      attribute :target, ::Sts::IsoSts::Target, collection: true
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :xref, ::Sts::IsoSts::Xref, collection: true
      attribute :break, ::Sts::IsoSts::Break, collection: true
      attribute :sub, ::Sts::IsoSts::Sub, collection: true
      attribute :sup, ::Sts::IsoSts::Sup, collection: true
      attribute :price, ::Sts::IsoSts::Price, collection: true

      xml do # rubocop:disable Metrics/BlockLength
        element "license-p"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "inline-supplementary-material",
                    to: :inline_supplementary_material
        map_element "related-article", to: :related_article
        map_element "related-object", to: :related_object
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
        map_element "element-citation", to: :element_citation
        map_element "mixed-citation", to: :mixed_citation
        map_element "std", to: :std
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "monospace", to: :monospace
        map_element "num", to: :num
        map_element "overline", to: :overline
        map_element "roman", to: :roman
        map_element "sans-serif", to: :sans_serif
        map_element "sc", to: :sc
        map_element "strike", to: :strike
        map_element "underline", to: :underline
        map_element "award-id", to: :award_id
        map_element "funding-source", to: :funding_source
        map_element "open-access", to: :open_access
        map_element "chem-struct", to: :chem_struct
        map_element "inline-formula", to: :inline_formula
        map_element "inline-graphic", to: :inline_graphic
        map_element "private-char", to: :private_char
        map_element "def-list", to: :def_list
        map_element "list", to: :list
        map_element "math", to: :math
        map_element "abbrev", to: :abbrev
        map_element "milestone-end", to: :milestone_end
        map_element "milestone-start", to: :milestone_start
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "disp-quote", to: :disp_quote
        map_element "speech", to: :speech
        map_element "statement", to: :statement
        map_element "verse-group", to: :verse_group
        map_element "fn", to: :fn
        map_element "target", to: :target
        map_element "entailedTerm", to: :entailed_term
        map_element "xref", to: :xref
        map_element "break", to: :break
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "price", to: :price
      end
    end
  end
end
