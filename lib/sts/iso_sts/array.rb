# frozen_string_literal: true

module Sts
  module IsoSts
    class Array < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :orientation, :string
      attribute :xml_lang, :string
      attribute :originator, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :table, ::Sts::IsoSts::Table
      attribute :attrib, ::Sts::NisoSts::Attrib, collection: true
      attribute :permissions, ::Sts::NisoSts::Permissions, collection: true

      xml do
        element "array"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "orientation", to: :orientation
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "originator", to: :originator

        map_element "label", to: :label
        map_element "table", to: :table
        map_element "attrib", to: :attrib
        map_element "permissions", to: :permissions
      end
    end
  end
end
