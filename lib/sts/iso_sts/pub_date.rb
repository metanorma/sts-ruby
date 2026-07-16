# frozen_string_literal: true

module Sts
  module IsoSts
    class PubDate < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :pub_type, :string

      xml do
        element "pub-date"

        map_content to: :content
        map_attribute "pub-type", to: :pub_type
      end
    end
  end
end
