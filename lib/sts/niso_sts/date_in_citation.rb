# frozen_string_literal: true

module Sts
  module NisoSts
    class DateInCitation < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :day, :string
      attribute :month, :string
      attribute :year, :string
      attribute :era, :string
      attribute :season, :string

      xml do
        element "date-in-citation"

        map_attribute "content-type", to: :content_type
        map_element "day", to: :day
        map_element "month", to: :month
        map_element "year", to: :year
        map_element "era", to: :era
        map_element "season", to: :season
      end
    end
  end
end
