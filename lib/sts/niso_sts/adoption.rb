# frozen_string_literal: true

module Sts
  module NisoSts
    class Adoption < Lutaml::Model::Serializable
      attribute :front, ::Sts::NisoSts::AdoptionFront
      attribute :back, ::Sts::NisoSts::Back
      attribute :id, :string
      attribute :lang, Lutaml::Xml::W3c::XmlLangType
      attribute :adoptions, ::Sts::NisoSts::Adoption, collection: true
      attribute :standard, ::Sts::NisoSts::Standard

      xml do
        element "adoption"
        ordered

        map_attribute "id", to: :id
        map_attribute "lang", to: :lang
        map_element "adoption-front", to: :front
        map_element "back", to: :back
        map_element "adoption", to: :adoptions
        map_element "standard", to: :standard
      end
    end
  end
end
