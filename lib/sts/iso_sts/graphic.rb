# frozen_string_literal: true

module Sts
  module IsoSts
    class Graphic < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :position, :string
      attribute :orientation, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content_type, :string
      attribute :mimetype, :string
      attribute :mime_subtype, :string
      attribute :xlink_href, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :caption, ::Sts::IsoSts::Caption
      attribute :alt_text, ::Sts::NisoSts::AltText
      attribute :long_desc, ::Sts::NisoSts::LongDesc

      xml do
        element "graphic"

        map_attribute "id", to: :id
        map_attribute "position", to: :position
        map_attribute "orientation", to: :orientation
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "content-type", to: :content_type
        map_attribute "mimetype", to: :mimetype
        map_attribute "mime-subtype", to: :mime_subtype
        map_attribute "xlink:href", to: :xlink_href

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "alt-text", to: :alt_text
        map_element "long-desc", to: :long_desc
      end
    end
  end
end
