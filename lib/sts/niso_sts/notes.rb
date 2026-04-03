# frozen_string_literal: true

module Sts
  module NisoSts
    class Notes < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :notes_type, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, ::Sts::NisoSts::Title
      attribute :note, ::Sts::NisoSts::NonNormativeNote, collection: true
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true

      xml do
        element "notes"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "notes-type", to: :notes_type
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label
        map_element "title", to: :title
        map_element "note", to: :note
        map_element "p", to: :p
      end
    end
  end
end
