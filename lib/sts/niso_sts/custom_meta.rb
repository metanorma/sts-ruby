# frozen_string_literal: true

module Sts
  module NisoSts
    class CustomMeta < Lutaml::Model::Serializable
      attribute :lang, Lutaml::Xml::W3c::XmlLangType
      attribute :meta_name, :string
      attribute :meta_value, :string

      xml do
        element "custom-meta"
        ordered

        map_attribute "lang", to: :lang
        map_element "meta-name", to: :meta_name
        map_element "meta-value", to: :meta_value
      end
    end
  end
end
