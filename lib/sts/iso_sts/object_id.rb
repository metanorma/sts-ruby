# frozen_string_literal: true

module Sts
  module IsoSts
    class ObjectId < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :pub_id_type, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :content, :string, collection: true

      xml do
        element "object-id"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "pub-id-type", to: :pub_id_type
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
      end
    end
  end
end
