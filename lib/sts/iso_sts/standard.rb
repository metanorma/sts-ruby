# frozen_string_literal: true

module Sts
  module IsoSts
    class Standard < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :lang, :string
      attribute :dtd_version, :string
      attribute :specific_use, :string
      attribute :front, ::Sts::IsoSts::Front
      attribute :body, ::Sts::IsoSts::Body
      attribute :back, ::Sts::IsoSts::Back

      xml do
        element "standard"
        map_attribute "id", to: :id
        map_attribute "lang", to: :lang
        map_attribute "dtd-version", to: :dtd_version
        map_attribute "specific-use", to: :specific_use

        map_element "front", to: :front
        map_element "body", to: :body
        map_element "back", to: :back
      end
    end
  end
end
