# frozen_string_literal: true

module Sts
  module NisoSts
    class Monospace < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :toggle, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true

      xml do
        element "monospace"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "toggle", to: :toggle
        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "underline", to: :underline
        map_element "styled-content", to: :styled_content
      end
    end
  end
end
