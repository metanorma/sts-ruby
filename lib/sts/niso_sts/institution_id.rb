# frozen_string_literal: true

module Sts
  module NisoSts
    class InstitutionId < Lutaml::Model::Serializable
      attribute :institution_id_type, :string
      attribute :content, :string

      xml do
        element "institution-id"
        mixed_content

        map_attribute "institution-id-type", to: :institution_id_type
        map_content to: :content
      end
    end
  end
end
