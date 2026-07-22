# frozen_string_literal: true

module Sts
  module IsoSts
    class PubDate < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :pub_type, :string
      attribute :id, :string

      xml do
        element "pub-date"

        map_content to: :content
        map_attribute "pub-type", to: :pub_type
        map_attribute "id", to: :id
      end
    end
  end
end
