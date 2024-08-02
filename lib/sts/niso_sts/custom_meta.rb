# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module NisoSts
    class CustomMeta < Sts::Mapper
      attribute :lang, Lutaml::Model::Type::String
      attribute :meta_name, Lutaml::Model::Type::String
      attribute :meta_value, Lutaml::Model::Type::String

      xml do
        root "custom-meta"

        map_attribute "lang", to: :lang,
                              namespace: "http://www.w3.org/XML/1998/namespace",
                              prefix: "xml"
        map_element "meta-name", to: :meta_name
        map_element "meta-value", to: :meta_value
      end
    end
  end
end
