# frozen_string_literal: true

module Sts
  module NisoSts
    class PersonGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :person_group_type, :string
      attribute :name, ::Sts::NisoSts::Name, collection: true
      attribute :collab, ::Sts::NisoSts::Collab, collection: true
      attribute :string_name, ::Sts::NisoSts::StringName, collection: true
      attribute :etal, ::Sts::NisoSts::Etal
      attribute :aff, ::Sts::NisoSts::Aff, collection: true

      xml do
        element "person-group"

        map_attribute "id", to: :id
        map_attribute "person-group-type", to: :person_group_type

        map_element "name", to: :name
        map_element "collab", to: :collab
        map_element "string-name", to: :string_name
        map_element "etal", to: :etal
        map_element "aff", to: :aff
      end
    end
  end
end
