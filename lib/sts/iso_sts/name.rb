# frozen_string_literal: true

module Sts
  module IsoSts
    class Name < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :name_style, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :surname, ::Sts::IsoSts::Surname
      attribute :given_names, ::Sts::IsoSts::GivenNames
      attribute :prefix, ::Sts::IsoSts::Prefix
      attribute :suffix, ::Sts::IsoSts::Suffix

      xml do
        element "name"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "name-style", to: :name_style
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_element "surname", to: :surname
        map_element "given-names", to: :given_names
        map_element "prefix", to: :prefix
        map_element "suffix", to: :suffix
      end
    end
  end
end
