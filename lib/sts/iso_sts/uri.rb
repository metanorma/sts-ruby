# frozen_string_literal: true

module Sts
  module IsoSts
    class Uri < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :content, :string, collection: true

      xml do
        element "uri"
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_content to: :content
      end
    end
  end
end
