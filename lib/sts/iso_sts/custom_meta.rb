# frozen_string_literal: true

module Sts
  module IsoSts
    class CustomMeta < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xlink_type, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :meta_name, ::Sts::IsoSts::MetaName
      attribute :meta_value, ::Sts::IsoSts::MetaValue

      xml do
        element "custom-meta"
        ordered

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_element "meta-name", to: :meta_name
        map_element "meta-value", to: :meta_value
      end
    end
  end
end
