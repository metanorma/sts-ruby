# frozen_string_literal: true

require_relative "standard"
require_relative "adoption_front"

module Sts
  module NisoSts
    class Adoption < Sts::Mapper
      attribute :front, AdoptionFront
      attribute :back, Back
      attribute :id, Lutaml::Model::Type::String
      attribute :lang, Lutaml::Model::Type::String
      attribute :adoptions, Adoption, collection: true
      attribute :standard, Standard

      xml do
        root "adoption", mixed: true

        map_attribute "id", to: :id
        map_attribute "lang", to: :lang,
                              namespace: "http://www.w3.org/XML/1998/namespace",
                              prefix: "xml"
        map_element "adoption-front", to: :front
        map_element "back", to: :back
        map_element "adoption", to: :adoptions
        map_element "standard", to: :standard
      end
    end
  end
end
