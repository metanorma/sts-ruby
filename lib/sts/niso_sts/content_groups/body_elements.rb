# frozen_string_literal: true

# Shared method to inject body-elements content group into a model class.
# This is a subset of para_level containing exactly the elements allowed in <body>.
# Used by Body.
#
# Call inside the class body:
#
#   ContentGroups.body_elements(self)
#
# And inside xml do ... end:
#
#   ContentGroups.body_elements_mappings(self)

module Sts
  module NisoSts
    module ContentGroups
      BODY_ELEMENTS = [
        [:sec, "Sts::NisoSts::Section", "sec"],
        [:term_sec, "Sts::NisoSts::TermSection", "term-sec"],
        [:p, "Sts::NisoSts::Paragraph", "p"],
        [:list, "Sts::NisoSts::List", "list"],
        [:def_list, "Sts::NisoSts::DefList", "def-list"],
        [:table_wrap, "Sts::TbxIsoTml::TableWrap", "table-wrap"],
        [:fig, "Sts::NisoSts::Figure", "fig"],
        [:non_normative_note, "Sts::NisoSts::NonNormativeNote",
         "non-normative-note"],
        [:non_normative_example, "Sts::NisoSts::NonNormativeExample",
         "non-normative-example"],
        [:preformat, "Sts::NisoSts::Preformat", "preformat"],
        [:styled_content, "Sts::NisoSts::StyledContent", "styled-content"],
        [:array, "Sts::NisoSts::SectionArray", "array"],
        [:disp_formula, "Sts::NisoSts::DisplayFormula", "disp-formula"],
        [:disp_formula_group, "Sts::NisoSts::DispFormulaGroup",
         "disp-formula-group"],
        [:editing_instruction, "Sts::NisoSts::EditingInstruction",
         "editing-instruction"],
        [:disp_quote, "Sts::NisoSts::DispQuote", "disp-quote"],
      ].freeze

      def self.body_elements(klass)
        inject_elements(klass, BODY_ELEMENTS)
      end

      def self.body_elements_mappings(klass)
        inject_element_mappings(klass, BODY_ELEMENTS)
      end
    end
  end
end
