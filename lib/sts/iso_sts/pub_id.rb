# frozen_string_literal: true

module Sts
  module IsoSts
    class PubId < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :pub_id_type, :string
      attribute :specific_use, :string
      attribute :id, :string

      xml do
        element "pub-id"

        map_content to: :content
        map_attribute "pub-id-type", to: :pub_id_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "id", to: :id
      end
    end
  end
end
