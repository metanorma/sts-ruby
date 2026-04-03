# frozen_string_literal: true

module Sts
  module NisoSts
    class InlineGraphic < Lutaml::Model::Serializable
      attribute :href, :xlink_href
      attribute :content_type, :string
      attribute :id, :string
      attribute :mimetype, :string
      attribute :mime_subtype, :string
      attribute :orientation, :string
      attribute :position, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string

      xml do
        element "inline-graphic"

        map_attribute "href", to: :href
        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "mimetype", to: :mimetype
        map_attribute "mime-subtype", to: :mime_subtype
        map_attribute "orientation", to: :orientation
        map_attribute "position", to: :position
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
      end
    end
  end
end
