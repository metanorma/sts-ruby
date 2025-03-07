# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class CustomMeta < Lutaml::Model::Serializable
      attribute :lang, :string
      attribute :meta_name, :string
      attribute :meta_value, :string

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
