# frozen_string_literal: true

module Sts
  module NisoSts
    class Aff < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :bold, :string, collection: true
      attribute :italic, :string, collection: true
      attribute :institution_wrap, ::Sts::NisoSts::InstitutionWrap
      attribute :institution, ::Sts::NisoSts::Institution, collection: true
      attribute :addr_line, ::Sts::NisoSts::AddrLine
      attribute :city, ::Sts::NisoSts::City
      attribute :state, ::Sts::NisoSts::State
      attribute :country, ::Sts::NisoSts::Country
      attribute :postal_code, ::Sts::NisoSts::PostalCode
      attribute :phone, ::Sts::NisoSts::Phone
      attribute :fax, ::Sts::NisoSts::Fax
      attribute :email, ::Sts::NisoSts::Email
      attribute :ext_link, ::Sts::NisoSts::ExtLink

      xml do
        element "aff"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "institution-wrap", to: :institution_wrap
        map_element "institution", to: :institution
        map_element "addr-line", to: :addr_line
        map_element "city", to: :city
        map_element "state", to: :state
        map_element "country", to: :country
        map_element "postal-code", to: :postal_code
        map_element "phone", to: :phone
        map_element "fax", to: :fax
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
      end
    end
  end
end
