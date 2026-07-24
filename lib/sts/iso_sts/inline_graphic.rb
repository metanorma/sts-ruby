# frozen_string_literal: true

module Sts
  module IsoSts
    class InlineGraphic < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :baseline_shift, :string
      attribute :mimetype, :string
      attribute :mime_subtype, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xlink_type, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :alt_text, ::Sts::IsoSts::AltText

      xml do
        element "inline-graphic"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "baseline-shift", to: :baseline_shift
        map_attribute "mimetype", to: :mimetype
        map_attribute "mime-subtype", to: :mime_subtype
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate

        map_element "alt-text", to: :alt_text
      end
    end
  end
end
