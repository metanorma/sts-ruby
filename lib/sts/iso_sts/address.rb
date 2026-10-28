# frozen_string_literal: true

module Sts
  module IsoSts
    class Address < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :originator, :string
      attribute :addr_line, ::Sts::IsoSts::AddrLine, collection: true
      attribute :country, ::Sts::IsoSts::Country, collection: true
      attribute :fax, ::Sts::IsoSts::Fax, collection: true
      attribute :institution, ::Sts::IsoSts::Institution, collection: true
      attribute :phone, ::Sts::IsoSts::Phone, collection: true
      attribute :email, ::Sts::IsoSts::Email, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true

      xml do
        element "address"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "originator", to: :originator
        map_element "addr-line", to: :addr_line
        map_element "country", to: :country
        map_element "fax", to: :fax
        map_element "institution", to: :institution
        map_element "phone", to: :phone
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
      end
    end
  end
end
