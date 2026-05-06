# frozen_string_literal: true

module Sts
  module NisoSts
    class DefHead < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true

      xml do
        element "def-head"
        mixed_content

        map_attribute "id", to: :id
        map_content to: :content
      end
    end
  end
end
