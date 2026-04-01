# frozen_string_literal: true

module Sts
  module NisoSts
    class Reference < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :mixed_citation, ::Sts::NisoSts::MixedCitation
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true

      xml do
        element "ref"
        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_element "label", to: :label
        map_element "std", to: :std
        map_element "mixed-citation", to: :mixed_citation
      end
    end
  end
end
