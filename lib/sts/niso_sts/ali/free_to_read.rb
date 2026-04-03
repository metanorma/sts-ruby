# frozen_string_literal: true

module Sts
  module NisoSts
    module Ali
      class FreeToRead < Lutaml::Model::Serializable
        attribute :content_type, :string
        attribute :end_date, :string
        attribute :id, :string
        attribute :specific_use, :string
        attribute :start_date, :string

        xml do
          element "ali:free_to_read"

          map_attribute "content-type", to: :content_type
          map_attribute "end_date", to: :end_date
          map_attribute "id", to: :id
          map_attribute "specific-use", to: :specific_use
          map_attribute "start_date", to: :start_date
        end
      end
    end
  end
end
