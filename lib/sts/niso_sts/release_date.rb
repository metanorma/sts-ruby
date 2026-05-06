# frozen_string_literal: true

module Sts
  module NisoSts
    class ReleaseDate < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      attribute :date_type, :string
      attribute :iso_8601_date, :string
      attribute :std_type, :string

      xml do
        element "release-date"
        map_attribute "id", to: :id
        mixed_content

        map_content to: :content
        map_attribute "date-type", to: :date_type
        map_attribute "iso-8601-date", to: :iso_8601_date
        map_attribute "std-type", to: :std_type
      end
    end
  end
end
