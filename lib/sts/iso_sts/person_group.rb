# frozen_string_literal: true

module Sts
  module IsoSts
    class PersonGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :person_group_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :anonymous, ::Sts::IsoSts::Anonymous, collection: true
      attribute :collab, ::Sts::IsoSts::Collab, collection: true
      attribute :name, ::Sts::IsoSts::Name, collection: true
      attribute :name_alternatives, ::Sts::IsoSts::NameAlternatives,
                collection: true
      attribute :aff, ::Sts::IsoSts::Aff, collection: true
      attribute :aff_alternatives, ::Sts::IsoSts::AffAlternatives,
                collection: true
      attribute :etal, ::Sts::IsoSts::Etal, collection: true
      attribute :role, ::Sts::IsoSts::Role, collection: true
      attribute :string_name, ::Sts::IsoSts::StringName, collection: true

      xml do
        element "person-group"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "person-group-type", to: :person_group_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
        map_element "anonymous", to: :anonymous
        map_element "collab", to: :collab
        map_element "name", to: :name
        map_element "name-alternatives", to: :name_alternatives
        map_element "aff", to: :aff
        map_element "aff-alternatives", to: :aff_alternatives
        map_element "etal", to: :etal
        map_element "role", to: :role
        map_element "string-name", to: :string_name
      end
    end
  end
end
