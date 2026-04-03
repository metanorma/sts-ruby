# frozen_string_literal: true

module Sts
  module NisoSts
    class FundingSource < Lutaml::Model::Serializable
      attribute :country, :string
      attribute :deposit_funder_name, :string
      attribute :funder_id, :string
      attribute :institution_id_type, :string
      attribute :xlink_href, :string
      attribute :content, :string

      xml do
        element "funding-source"
        mixed_content

        map_attribute "country", to: :country
        map_attribute "deposit-funder-name", to: :deposit_funder_name
        map_attribute "funder-id", to: :funder_id
        map_attribute "institution-id-type", to: :institution_id_type
        map_attribute "xlink:href", to: :xlink_href
        map_content to: :content
      end
    end
  end
end
