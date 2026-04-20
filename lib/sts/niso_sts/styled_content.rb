# frozen_string_literal: true

module Sts
  module NisoSts
    class StyledContent < Lutaml::Model::Serializable
      attribute :style, :string
      attribute :style_type, :string
      attribute :toggle, :string
      attribute :specific_use, :string
      attribute :lang, :string
      attribute :content, :string, collection: true
      xml do
        element "styled-content"
        mixed_content

        map_attribute "style", to: :style
        map_attribute "style-type", to: :style_type
        map_attribute "toggle", to: :toggle
        map_attribute "specific-use", to: :specific_use
        map_attribute "lang", to: :lang
        map_content to: :content
      end
    end
  end
end
