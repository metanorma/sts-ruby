# frozen_string_literal: true

module Sts
  module NisoSts
    class ElocationId < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :elocation_id_type, :string

      xml do
        element "elocation-id"

        map_content to: :content
        map_attribute "elocation-id-type", to: :elocation_id_type
      end
    end
  end
end
