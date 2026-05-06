# frozen_string_literal: true

module Sts
  module NisoSts
    class Date < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :day, :string
      attribute :month, :string
      attribute :year, :string
      attribute :era, :string
      attribute :season, :string
      attribute :date_type, :string

      xml do
        element "date"
        map_attribute "id", to: :id
        ordered

        map_attribute "date-type", to: :date_type
        map_element "day", to: :day
        map_element "month", to: :month
        map_element "year", to: :year
        map_element "era", to: :era
        map_element "season", to: :season
      end
    end
  end
end
