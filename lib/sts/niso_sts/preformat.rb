# frozen_string_literal: true

module Sts
  module NisoSts
    class Preformat < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :preformat_type, :string
      attribute :xml_space, :string
      attribute :language, :string
      attribute :orientation, :string
      attribute :position, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true

      xml do
        element "preformat"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "preformat-type", to: :preformat_type
        map_attribute "xml:space", to: :xml_space
        map_attribute "language", to: :language
        map_attribute "orientation", to: :orientation
        map_attribute "position", to: :position
        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "underline", to: :underline
        map_element "styled-content", to: :styled_content
        map_element "std", to: :std
      end
    end
  end
end
