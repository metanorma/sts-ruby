# frozen_string_literal: true

module Sts
  module NisoSts
    class InstitutionId < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :institution_id_type, :string
      attribute :content, :string, collection: true
      xml do
        element "institution-id"
        map_attribute "id", to: :id
        mixed_content

        map_attribute "institution-id-type", to: :institution_id_type
        map_content to: :content
      end
    end
  end
end
