# frozen_string_literal: true

module Sts
  module IsoSts
    class License < Lutaml::Model::Serializable
      attribute :license_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xlink_type, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :license_p, ::Sts::IsoSts::LicenseP, collection: true

      xml do
        element "license"
        ordered

        map_attribute "license-type", to: :license_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate

        map_element "license-p", to: :license_p
      end
    end
  end
end
