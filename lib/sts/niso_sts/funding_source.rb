# frozen_string_literal: true

module Sts
  module NisoSts
    class FundingSource < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :country, :string
      attribute :deposit_funder_name, :string
      attribute :funder_id, :string
      attribute :institution_id_type, :string
      attribute :xlink_href, :string
      attribute :content, :string, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::NisoSts::Target,
                collection: true
      xml do
        element "funding-source"
        map_attribute "id", to: :id
        mixed_content

        map_attribute "country", to: :country
        map_attribute "deposit-funder-name", to: :deposit_funder_name
        map_attribute "funder-id", to: :funder_id
        map_attribute "institution-id-type", to: :institution_id_type
        map_attribute "xlink:href", to: :xlink_href
        map_content to: :content
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end
