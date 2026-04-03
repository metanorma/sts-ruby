# frozen_string_literal: true

module Sts
  module NisoSts
    class History < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :date, ::Sts::NisoSts::MetaDate, collection: true

      xml do
        element "history"

        map_attribute "id", to: :id

        map_element "date", to: :date
      end
    end
  end
end
