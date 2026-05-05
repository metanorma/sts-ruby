# frozen_string_literal: true

# Shared method to inject para-level XSD content group into a model class.
# This content group represents the common block-level elements shared by
# Section, App, NonNormativeNote, NonNormativeExample, NormativeNote,
# NormativeExample, BoxedText, DispQuote, and Glossary.
#
# Call inside the class body:
#
#   ContentGroups.para_level(self)
#
# And inside xml do ... end:
#
#   ContentGroups.para_level_mappings(self)

module Sts
  module NisoSts
    module ContentGroups
      PARA_LEVEL_ELEMENTS = [
        [:p, "Sts::NisoSts::Paragraph", "p"],
        [:array, "Sts::NisoSts::SectionArray", "array"],
        [:list, "Sts::NisoSts::List", "list"],
        [:def_list, "Sts::NisoSts::DefList", "def-list"],
        [:preformat, "Sts::NisoSts::Preformat", "preformat"],
        [:fig, "Sts::NisoSts::Figure", "fig"],
        [:fig_group, "Sts::NisoSts::FigGroup", "fig-group"],
        [:graphic, "Sts::NisoSts::Graphic", "graphic"],
        [:media, "Sts::NisoSts::Media", "media"],
        [:table_wrap, "Sts::TbxIsoTml::TableWrap", "table-wrap"],
        [:disp_formula, "Sts::NisoSts::DisplayFormula", "disp-formula"],
        [:disp_formula_group, "Sts::NisoSts::DispFormulaGroup",
         "disp-formula-group"],
        [:disp_quote, "Sts::NisoSts::DispQuote", "disp-quote"],
        [:chem_struct_wrap, "Sts::NisoSts::ChemStructWrap", "chem-struct-wrap"],
        [:supplementary_material, "Sts::NisoSts::SupplementaryMaterial",
         "supplementary-material"],
        [:editing_instruction, "Sts::NisoSts::EditingInstruction",
         "editing-instruction"],
        [:address, "Sts::NisoSts::Address", "address"],
        [:alternatives, "Sts::NisoSts::Alternatives", "alternatives"],
        [:non_normative_note, "Sts::NisoSts::NonNormativeNote",
         "non-normative-note"],
        [:non_normative_example, "Sts::NisoSts::NonNormativeExample",
         "non-normative-example"],
        [:normative_note, "Sts::NisoSts::NormativeNote", "normative-note"],
        [:normative_example, "Sts::NisoSts::NormativeExample",
         "normative-example"],
        [:notes_group, "Sts::NisoSts::NotesGroup", "notes-group"],
        [:related_article, "Sts::NisoSts::RelatedArticle", "related-article"],
        [:related_object, "Sts::NisoSts::RelatedObject", "related-object"],
        [:speech, "Sts::NisoSts::Speech", "speech"],
        [:statement, "Sts::NisoSts::Statement", "statement"],
        [:verse_group, "Sts::NisoSts::VerseGroup", "verse-group"],
        [:math, "Sts::TbxIsoTml::Math", "math"],
        [:tex_math, "Sts::NisoSts::TexMath", "tex-math"],
      ].freeze

      def self.para_level(klass)
        inject_elements(klass, PARA_LEVEL_ELEMENTS)
      end

      def self.para_level_mappings(klass)
        inject_element_mappings(klass, PARA_LEVEL_ELEMENTS)
      end
    end
  end
end
