# frozen_string_literal: true

module Sts
  module NisoSts
    class PrivateChar < Lutaml::Model::Serializable
      attribute :description, :string
      attribute :name, :string
      attribute :specific_use, :string
      attribute :content, :string

      xml do
        element "private-char"
        mixed_content

        map_attribute "description", to: :description
        map_attribute "name", to: :name
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
      end
    end
  end
end
