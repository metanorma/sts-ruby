# frozen_string_literal: true

module Sts
  module IsoSts
    class ExtLink < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :ext_link_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xlink_href, :string
      attribute :xlink_type, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :content, :string
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :named_content, ::Sts::IsoSts::NamedContent

      xml do
        element "ext-link"

        map_attribute "id", to: :id
        map_attribute "ext-link-type", to: :ext_link_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate

        map_content to: :content

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "named-content", to: :named_content
      end
    end
  end
end
