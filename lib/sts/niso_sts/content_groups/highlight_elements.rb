# frozen_string_literal: true

# Shared method to inject highlight-elements XSD content group into a model class.
# This is the set of child elements shared by Bold and Italic (excluding their
# self-referencing attribute, which each model declares separately).
#
# Call inside the class body:
#
#   ContentGroups.highlight_elements(self)
#
# And inside xml do ... end:
#
#   ContentGroups.highlight_elements_mappings(self)

module Sts
  module NisoSts
    module ContentGroups
      HIGHLIGHT_ELEMENTS = [
        [:sub, "Sts::NisoSts::Sub", "sub"],
        [:sup, "Sts::NisoSts::Sup", "sup"],
        [:monospace, "Sts::NisoSts::Monospace", "monospace"],
        [:sc, "Sts::NisoSts::Sc", "sc"],
        [:std_ref, "Sts::NisoSts::StandardRef", "std-ref"],
        [:underline, "Sts::NisoSts::Underline", "underline"],
        [:strike, "Sts::NisoSts::Strike", "strike"],
        [:xref, "Sts::TbxIsoTml::Xref", "xref"],
        [:ext_link, "Sts::NisoSts::ExtLink", "ext-link"],
        [:fn, "Sts::NisoSts::Fn", "fn"],
        [:styled_content, "Sts::NisoSts::StyledContent", "styled-content"],
        [:array, "Sts::NisoSts::SectionArray", "array"],
        [:break, "Sts::TbxIsoTml::TableBreak", "break"],
        [:target, "Sts::NisoSts::Target", "target"],
        [:overline, "Sts::NisoSts::Overline", "overline"],
        [:roman, "Sts::NisoSts::Roman", "roman"],
        [:sans_serif, "Sts::NisoSts::SansSerif", "sans-serif"],
        [:ruby, "Sts::NisoSts::Ruby", "ruby"],
        [:named_content, "Sts::NisoSts::NamedContent", "named-content"],
        [:uri, "Sts::NisoSts::Uri", "uri"],
        [:inline_formula, "Sts::NisoSts::InlineFormula", "inline-formula"],
      ].freeze

      def self.highlight_elements(klass)
        inject_elements(klass, HIGHLIGHT_ELEMENTS)
      end

      def self.highlight_elements_mappings(klass)
        inject_element_mappings(klass, HIGHLIGHT_ELEMENTS)
      end
    end
  end
end
