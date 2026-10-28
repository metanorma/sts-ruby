# frozen_string_literal: true

module Sts
  module IsoSts
    class Date < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :date_type, :string
      attribute :specific_use, :string
      attribute :day, ::Sts::IsoSts::Day
      attribute :month, ::Sts::IsoSts::Month
      attribute :season, ::Sts::IsoSts::Season
      attribute :year, ::Sts::IsoSts::Year

      xml do
        element "date"
        ordered

        map_attribute "id", to: :id
        map_attribute "date-type", to: :date_type
        map_attribute "specific-use", to: :specific_use
        map_element "day", to: :day
        map_element "month", to: :month
        map_element "season", to: :season
        map_element "year", to: :year
      end
    end
  end
end
