# frozen_string_literal: true

# Shared method to inject p-elements XSD content group into a model class.
# Extends styled_content_elements with citation and funding elements.
# Used by Paragraph.
#
# Call inside the class body:
#
#   ContentGroups.p_elements(self)
#
# And inside xml do ... end:
#
#   ContentGroups.p_elements_mappings(self)

module Sts
  module NisoSts
    module ContentGroups
      P_ELEMENTS_EXTRA = [
        [:ref_list, "Sts::NisoSts::ReferenceList", "ref-list"],
        [:citation_alternatives, "Sts::NisoSts::CitationAlternatives",
         "citation-alternatives"],
        [:element_citation, "Sts::NisoSts::ElementCitation",
         "element-citation"],
        [:mixed_citation, "Sts::NisoSts::MixedCitation", "mixed-citation"],
        [:award_id, "Sts::NisoSts::AwardId", "award-id"],
        [:funding_source, "Sts::NisoSts::FundingSource", "funding-source"],
        [:open_access, "Sts::NisoSts::OpenAccess", "open-access"],
      ].freeze

      def self.p_elements(klass)
        styled_content_elements(klass)
        inject_elements(klass, P_ELEMENTS_EXTRA)
      end

      def self.p_elements_mappings(klass)
        styled_content_elements_mappings(klass)
        inject_element_mappings(klass, P_ELEMENTS_EXTRA)
      end
    end
  end
end
