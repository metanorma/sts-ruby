# frozen_string_literal: true

module Sts
  module NisoSts
    class VolumeId < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :pub_id_type, :string
      attribute :content, :string, collection: true
      xml do
        element "volume-id"
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "pub-id-type", to: :pub_id_type
        map_content to: :content
      end
    end
  end
end
