# frozen_string_literal: true

module Sts
  module NisoSts
    class NotesGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, ::Sts::NisoSts::Title
      attribute :notes, ::Sts::NisoSts::Notes, collection: true

      xml do
        element "notes-group"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label
        map_element "title", to: :title
        map_element "notes", to: :notes
      end
    end
  end
end
