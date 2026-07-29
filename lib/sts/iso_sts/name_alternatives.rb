# frozen_string_literal: true

module Sts
  module IsoSts
    class NameAlternatives < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :name, ::Sts::IsoSts::Name, collection: true
      attribute :string_name, ::Sts::IsoSts::StringName, collection: true

      xml do
        element "name-alternatives"
        ordered

        map_attribute "id", to: :id
        map_element "name", to: :name
        map_element "string-name", to: :string_name
      end
    end
  end
end
