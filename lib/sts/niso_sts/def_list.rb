# frozen_string_literal: true

module Sts
  module NisoSts
    class DefList < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :continued_from, :string
      attribute :list_content, :string
      attribute :list_type, :string
      attribute :originator, :string
      attribute :prefix_word, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :editing_instruction, ::Sts::NisoSts::EditingInstruction,
                collection: true
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, :string
      attribute :term_head, ::Sts::NisoSts::TermHead
      attribute :def_head, ::Sts::NisoSts::DefHead
      attribute :def_item, ::Sts::NisoSts::DefItem, collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true

      xml do
        element "def-list"
        ordered

        map_attribute "id", to: :id
        map_attribute "continued-from", to: :continued_from
        map_attribute "list-content", to: :list_content
        map_attribute "list-type", to: :list_type
        map_attribute "originator", to: :originator
        map_attribute "prefix-word", to: :prefix_word
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "editing-instruction", to: :editing_instruction
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
