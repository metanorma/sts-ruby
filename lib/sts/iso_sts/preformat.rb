# frozen_string_literal: true

module Sts
  module IsoSts
    class Preformat < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :position, :string
      attribute :orientation, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :preformat_type, :string
      attribute :originator, :string
      attribute :xml_space, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :underline, ::Sts::IsoSts::Underline, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true

      xml do
        element "preformat"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "position", to: :position
        map_attribute "orientation", to: :orientation
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "preformat-type", to: :preformat_type
        map_attribute "originator", to: :originator
        map_attribute "xml:space", to: :xml_space

        map_content to: :content

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "styled-content", to: :styled_content
      end
    end
  end
end
