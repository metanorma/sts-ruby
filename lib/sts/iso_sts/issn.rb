# frozen_string_literal: true

module Sts
  module IsoSts
    class Issn < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :pub_type, :string
      attribute :specific_use, :string
      attribute :content, :string, collection: true

      xml do
        element "issn"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "pub-type", to: :pub_type
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
      end
    end
  end
end
