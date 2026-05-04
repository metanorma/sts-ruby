# frozen_string_literal: true

module Sts
  module NisoSts
    class Abstract < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :abstract_type, :string
      attribute :lang, Lutaml::Xml::W3c::XmlLangType
      attribute :title, :string
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true

      xml do
        element "abstract"
        ordered

        map_attribute "id", to: :id
        map_attribute "abstract-type", to: :abstract_type
        map_attribute "xml:lang", to: :lang
        map_element "title", to: :title
        map_element "p", to: :p
      end
    end
  end
end
