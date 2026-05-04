# frozen_string_literal: true

module Sts
  module IsoSts
    class List < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :list_type, :string
      attribute :prefix_word, :string
      attribute :list_content, :string
      attribute :continued_from, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :originator, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :title, ::Sts::IsoSts::Title
      attribute :list_item, ::Sts::IsoSts::ListItem, collection: true

      xml do
        element "list"
        ordered

        map_attribute "id", to: :id
        map_attribute "list-type", to: :list_type
        map_attribute "prefix-word", to: :prefix_word
        map_attribute "list-content", to: :list_content
        map_attribute "continued-from", to: :continued_from
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "originator", to: :originator

        map_element "label", to: :label
        map_element "title", to: :title
        map_element "list-item", to: :list_item
      end
    end
  end
end
