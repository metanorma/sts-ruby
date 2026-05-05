# frozen_string_literal: true

# Shared method to inject styled-content-elements XSD content group into a model class.
# This is the largest content group, used by StyledContent and extended by p_elements.
#
# Call inside the class body:
#
#   ContentGroups.styled_content_elements(self)
#
# And inside xml do ... end:
#
#   ContentGroups.styled_content_elements_mappings(self)

module Sts
  module NisoSts
    module ContentGroups
      STYLED_CONTENT_ELEMENTS = [
        [:bold, "Sts::TbxIsoTml::Bold", "bold"],
        [:italic, "Sts::TbxIsoTml::Italic", "italic"],
        [:sub, "Sts::NisoSts::Sub", "sub"],
        [:sup, "Sts::NisoSts::Sup", "sup"],
        [:sc, "Sts::NisoSts::Sc", "sc"],
        [:monospace, "Sts::NisoSts::Monospace", "monospace"],
        [:underline, "Sts::NisoSts::Underline", "underline"],
        [:overline, "Sts::NisoSts::Overline", "overline"],
        [:roman, "Sts::NisoSts::Roman", "roman"],
        [:sans_serif, "Sts::NisoSts::SansSerif", "sans-serif"],
        [:strike, "Sts::NisoSts::Strike", "strike"],
        [:xref, "Sts::TbxIsoTml::Xref", "xref"],
        [:ext_link, "Sts::NisoSts::ExtLink", "ext-link"],
        [:uri, "Sts::NisoSts::Uri", "uri"],
        [:fn, "Sts::NisoSts::Fn", "fn"],
        [:inline_formula, "Sts::NisoSts::InlineFormula", "inline-formula"],
        [:break, "Sts::NisoSts::Break", "break"],
        [:target, "Sts::NisoSts::Target", "target"],
        [:named_content, "Sts::NisoSts::NamedContent", "named-content"],
        [:styled_content, "Sts::NisoSts::StyledContent", "styled-content"],
        [:array, "Sts::NisoSts::SectionArray", "array"],
        [:std, "Sts::NisoSts::ReferenceStandard", "std"],
        [:graphic, "Sts::NisoSts::Graphic", "graphic"],
        [:inline_graphic, "Sts::NisoSts::InlineGraphic", "inline-graphic"],
        [:private_char, "Sts::NisoSts::PrivateChar", "private-char"],
        [:preformat, "Sts::NisoSts::Preformat", "preformat"],
        [:fig, "Sts::NisoSts::Figure", "fig"],
        [:fig_group, "Sts::NisoSts::FigGroup", "fig-group"],
        [:media, "Sts::NisoSts::Media", "media"],
        [:table_wrap, "Sts::TbxIsoTml::TableWrap", "table-wrap"],
        [:boxed_text, "Sts::NisoSts::BoxedText", "boxed-text"],
        [:chem_struct_wrap, "Sts::NisoSts::ChemStructWrap", "chem-struct-wrap"],
        [:chem_struct, "Sts::NisoSts::ChemStruct", "chem-struct"],
        [:list, "Sts::NisoSts::List", "list"],
        [:def_list, "Sts::NisoSts::DefList", "def-list"],
        [:disp_formula, "Sts::NisoSts::DisplayFormula", "disp-formula"],
        [:disp_formula_group, "Sts::NisoSts::DispFormulaGroup",
         "disp-formula-group"],
        [:disp_quote, "Sts::NisoSts::DispQuote", "disp-quote"],
        [:speech, "Sts::NisoSts::Speech", "speech"],
        [:statement, "Sts::NisoSts::Statement", "statement"],
        [:verse_group, "Sts::NisoSts::VerseGroup", "verse-group"],
        [:non_normative_note, "Sts::NisoSts::NonNormativeNote",
         "non-normative-note"],
        [:non_normative_example, "Sts::NisoSts::NonNormativeExample",
         "non-normative-example"],
        [:normative_note, "Sts::NisoSts::NormativeNote", "normative-note"],
        [:normative_example, "Sts::NisoSts::NormativeExample",
         "normative-example"],
        [:notes_group, "Sts::NisoSts::NotesGroup", "notes-group"],
        [:supplementary_material, "Sts::NisoSts::SupplementaryMaterial",
         "supplementary-material"],
        [:address, "Sts::NisoSts::Address", "address"],
        [:alternatives, "Sts::NisoSts::Alternatives", "alternatives"],
        [:related_article, "Sts::NisoSts::RelatedArticle", "related-article"],
        [:related_object, "Sts::NisoSts::RelatedObject", "related-object"],
        [:math, "Sts::TbxIsoTml::Math", "math"],
        [:tex_math, "Sts::NisoSts::TexMath", "tex-math"],
        [:ruby, "Sts::NisoSts::Ruby", "ruby"],
        [:email, "Sts::NisoSts::Email", "email"],
        [:entailed_term, "Sts::TbxIsoTml::EntailedTerm", "entailedTerm"],
        [:index_term, "Sts::NisoSts::IndexTerm", "index-term"],
        [:milestone_end, "Sts::NisoSts::MilestoneEnd", "milestone-end"],
        [:milestone_start, "Sts::NisoSts::MilestoneStart", "milestone-start"],
      ].freeze

      def self.styled_content_elements(klass)
        inject_elements(klass, STYLED_CONTENT_ELEMENTS)
      end

      def self.styled_content_elements_mappings(klass)
        inject_element_mappings(klass, STYLED_CONTENT_ELEMENTS)
      end
    end
  end
end
