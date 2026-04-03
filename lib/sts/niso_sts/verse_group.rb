# frozen_string_literal: true

module Sts
  module NisoSts
    class VerseGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :title, ::Sts::NisoSts::Title
      attribute :label, ::Sts::NisoSts::Label
      attribute :verse_line, ::Sts::NisoSts::VerseLine, collection: true
      attribute :attrib, ::Sts::NisoSts::Attrib

      xml do
        element "verse-group"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use

        map_element "title", to: :title
        map_element "label", to: :label
        map_element "verse-line", to: :verse_line
        map_element "attrib", to: :attrib
      end
    end
  end
end
