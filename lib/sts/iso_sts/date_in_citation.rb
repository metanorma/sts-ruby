# frozen_string_literal: true

module Sts
  module IsoSts
    class DateInCitation < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :day, ::Sts::IsoSts::Day, collection: true
      attribute :month, ::Sts::IsoSts::Month, collection: true
      attribute :season, ::Sts::IsoSts::Season, collection: true
      attribute :year, ::Sts::IsoSts::Year, collection: true

      xml do
        element "date-in-citation"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
        map_element "day", to: :day
        map_element "month", to: :month
        map_element "season", to: :season
        map_element "year", to: :year
      end
    end
  end
end
