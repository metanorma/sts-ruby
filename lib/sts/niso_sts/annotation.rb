# frozen_string_literal: true

module Sts
  module NisoSts
    class Annotation < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :symbol, :string
      xml do
        element "annotation"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use
        map_attribute "symbol", to: :symbol
      end
    end
  end
end
