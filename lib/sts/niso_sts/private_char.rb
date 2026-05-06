# frozen_string_literal: true

module Sts
  module NisoSts
    class PrivateChar < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :description, :string
      attribute :name, :string
      attribute :specific_use, :string
      xml do
        element "private-char"
        map_attribute "id", to: :id
        ordered

        map_attribute "description", to: :description
        map_attribute "name", to: :name
        map_attribute "specific-use", to: :specific_use
      end
    end
  end
end
