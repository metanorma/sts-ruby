# frozen_string_literal: true

module Sts
  module NisoSts
    class PubId < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :pub_id_type, :string
      attribute :assigning_authority, :string
      attribute :content, :string

      xml do
        element "pub-id"

        map_attribute "id", to: :id
        map_attribute "pub-id-type", to: :pub_id_type
        map_attribute "assigning-authority", to: :assigning_authority
        map_content to: :content
      end
    end
  end
end
