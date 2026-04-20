# frozen_string_literal: true

module Sts
  module NisoSts
    module Ali
      class LicenseRef < Lutaml::Model::Serializable
        attribute :content, :string, collection: true
        attribute :content_type, :string
        attribute :id, :string
        attribute :specific_use, :string
        attribute :start_date, :string

        xml do
          element "ali:license_ref"
          mixed_content

          map_content to: :content
          map_attribute "content-type", to: :content_type
          map_attribute "id", to: :id
          map_attribute "specific-use", to: :specific_use
          map_attribute "start_date", to: :start_date
        end
      end
    end
  end
end
