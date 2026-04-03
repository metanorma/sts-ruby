# frozen_string_literal: true

module Sts
  module NisoSts
    class ContribId < Lutaml::Model::Serializable
      attribute :contrib_id_type, :string
      attribute :authenticated, :string
      attribute :content, :string

      xml do
        element "contrib-id"
        mixed_content

        map_attribute "contrib-id-type", to: :contrib_id_type
        map_attribute "authenticated", to: :authenticated
        map_content to: :content
      end
    end
  end
end
