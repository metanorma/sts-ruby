# frozen_string_literal: true

module Sts
  module IsoSts
    class StringName < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :name_style, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :degrees, ::Sts::IsoSts::Degrees, collection: true
      attribute :given_names, ::Sts::IsoSts::GivenNames, collection: true
      attribute :prefix, ::Sts::IsoSts::Prefix, collection: true
      attribute :surname, ::Sts::IsoSts::Surname, collection: true
      attribute :suffix, ::Sts::IsoSts::Suffix, collection: true

      xml do
        element "string-name"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "name-style", to: :name_style
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
        map_element "degrees", to: :degrees
        map_element "given-names", to: :given_names
        map_element "prefix", to: :prefix
        map_element "surname", to: :surname
        map_element "suffix", to: :suffix
      end
    end
  end
end
