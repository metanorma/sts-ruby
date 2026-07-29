# frozen_string_literal: true

module Sts
  module IsoSts
    class VerseGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :originator, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :title, ::Sts::IsoSts::Title
      attribute :subtitle, ::Sts::IsoSts::Subtitle
      attribute :verse_line, ::Sts::IsoSts::VerseLine, collection: true
      attribute :verse_group, ::Sts::IsoSts::VerseGroup, collection: true
      attribute :attrib, ::Sts::IsoSts::Attrib, collection: true
      attribute :permissions, ::Sts::IsoSts::Permissions, collection: true

      xml do
        element "verse-group"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "originator", to: :originator
        map_element "label", to: :label
        map_element "title", to: :title
        map_element "subtitle", to: :subtitle
        map_element "verse-line", to: :verse_line
        map_element "verse-group", to: :verse_group
        map_element "attrib", to: :attrib
        map_element "permissions", to: :permissions
      end
    end
  end
end
