# frozen_string_literal: true

module Sts
  module NisoSts
    class PubDate < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :day, :string
      attribute :month, :string
      attribute :year, :string
      attribute :era, :string
      attribute :season, :string
      attribute :content, :string
      attribute :date_type, :string
      attribute :iso_8601_date, :string
      attribute :publication_format, :string

      xml do
        element "pub-date"

        map_attribute "id", to: :id
        map_attribute "date-type", to: :date_type
        map_content to: :content
        map_attribute "iso-8601-date", to: :iso_8601_date
        map_attribute "publication-format", to: :publication_format
        map_element "day", to: :day
        map_element "month", to: :month
        map_element "year", to: :year
        map_element "era", to: :era
        map_element "season", to: :season
      end
    end
  end
end
