# frozen_string_literal: true

module Sts
  module IsoSts
    class ListItem < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample,
                collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true

      xml do
        element "list-item"
        ordered

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "label", to: :label
        map_element "p", to: :paragraph
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "def-list", to: :def_list
        map_element "list", to: :list
      end
    end
  end
end
