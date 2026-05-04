# frozen_string_literal: true

module Sts
  module NisoSts
    class Glossary < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, ::Sts::NisoSts::Title
      attribute :paragraphs, ::Sts::NisoSts::Paragraph, collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true
      attribute :glossary, ::Sts::NisoSts::Glossary, collection: true
      attribute :sec, ::Sts::NisoSts::Section, collection: true

      xml do
        element "glossary"
        ordered

        map_attribute "id", to: :id
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label
        map_element "title", to: :title
        map_element "p", to: :paragraphs
        map_element "def-list", to: :def_list
        map_element "glossary", to: :glossary
        map_element "sec", to: :sec
      end
    end
  end
end
