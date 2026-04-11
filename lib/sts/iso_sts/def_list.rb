# frozen_string_literal: true

module Sts
  module IsoSts
    class DefList < Lutaml::Model::Serializable
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
      attribute :term_head, ::Sts::NisoSts::TermHead
      attribute :def_head, ::Sts::TbxIsoTml::Definition
      attribute :def_item, ::Sts::IsoSts::DefItem, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true

      xml do
        element "def-list"

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
        map_element "term-head", to: :term_head
        map_element "def-head", to: :def_head
        map_element "def-item", to: :def_item
        map_element "def-list", to: :def_list
      end
    end
  end
end
