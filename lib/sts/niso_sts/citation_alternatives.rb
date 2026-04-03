# frozen_string_literal: true

module Sts
  module NisoSts
    class CitationAlternatives < Lutaml::Model::Serializable
      attribute :mixed_citation, ::Sts::NisoSts::MixedCitation
      attribute :element_citation, ::Sts::NisoSts::ElementCitation
      attribute :nlm_citation, ::Sts::NisoSts::NlmCitation

      xml do
        element "citation-alternatives"

        map_element "mixed-citation", to: :mixed_citation
        map_element "element-citation", to: :element_citation
        map_element "nlm-citation", to: :nlm_citation
      end
    end
  end
end
