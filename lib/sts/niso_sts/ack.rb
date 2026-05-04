# frozen_string_literal: true

module Sts
  module NisoSts
    class Ack < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :title, ::Sts::NisoSts::Title
      attribute :paragraphs, ::Sts::NisoSts::Paragraph, collection: true
      attribute :sec, ::Sts::NisoSts::Section, collection: true

      xml do
        element "ack"
        ordered

        map_attribute "id", to: :id
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use

        map_element "title", to: :title
        map_element "p", to: :paragraphs
        map_element "sec", to: :sec
      end
    end
  end
end
