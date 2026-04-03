# frozen_string_literal: true

module Sts
  module NisoSts
    class ReleaseDate < Lutaml::Model::Serializable
      attribute :day, :string
      attribute :month, :string
      attribute :year, :string

      xml do
        element "release-date"

        map_element "day", to: :day
        map_element "month", to: :month
        map_element "year", to: :year
      end
    end
  end
end
