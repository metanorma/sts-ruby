# frozen_string_literal: true

module Sts
  module NisoSts
    class Reference < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :mixed_citation, ::Sts::NisoSts::MixedCitation
      attribute :element_citation, ::Sts::NisoSts::ElementCitation
      attribute :nlm_citation, ::Sts::NisoSts::NlmCitation
      attribute :citation_alternatives, ::Sts::NisoSts::CitationAlternatives
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true

      xml do
        element "ref"
        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_element "label", to: :label
        map_element "std", to: :std
        map_element "mixed-citation", to: :mixed_citation
        map_element "element-citation", to: :element_citation
        map_element "nlm-citation", to: :nlm_citation
        map_element "citation-alternatives", to: :citation_alternatives
      end
    end
  end
end
