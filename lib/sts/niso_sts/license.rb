# frozen_string_literal: true

module Sts
  module NisoSts
    class License < Lutaml::Model::Serializable
      attribute :href, :xlink_href
      attribute :lang, Lutaml::Xml::W3c::XmlLangType
      attribute :license_p, ::Sts::NisoSts::LicenseP, collection: true

      xml do
        element "license"

        map_attribute "xlink:href", to: :href
        map_attribute "xml:lang", to: :lang
        map_element "license-p", to: :license_p
      end
    end
  end
end
