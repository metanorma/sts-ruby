# frozen_string_literal: true

module Sts
  module IsoSts
    class CopyrightStatement < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :ext_link, ::Sts::IsoSts::ExtLink
      attribute :uri, ::Sts::IsoSts::Uri

      xml do
        element "copyright-statement"
        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        mixed_content

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
      end
    end
  end
end
