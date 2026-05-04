# frozen_string_literal: true

module Sts
  module NisoSts
    class Underline < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :toggle, :string
      attribute :content, :string, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true

      xml do
        element "underline"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "toggle", to: :toggle
        map_content to: :content
        map_element "std", to: :std
        map_element "underline", to: :underline
      end
    end
  end
end
