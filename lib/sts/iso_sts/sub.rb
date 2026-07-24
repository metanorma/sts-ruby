# frozen_string_literal: true

module Sts
  module IsoSts
    class Sub < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :arrange, :string
      attribute :specific_use, :string
      attribute :content, :string, collection: true
      xml do
        element "sub"
        map_attribute "id", to: :id
        map_attribute "arrange", to: :arrange
        map_attribute "specific-use", to: :specific_use
        mixed_content

        map_content to: :content
      end
    end
  end
end
