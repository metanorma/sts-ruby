# frozen_string_literal: true

module Sts
  module IsoSts
    class Anonymous < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string

      xml do
        element "anonymous"

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
      end
    end
  end
end
