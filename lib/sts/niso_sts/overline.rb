# frozen_string_literal: true

module Sts
  module NisoSts
    class Overline < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :toggle, :string
      attribute :content, :string, collection: true
      xml do
        element "overline"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "toggle", to: :toggle
        map_content to: :content
      end
    end
  end
end
