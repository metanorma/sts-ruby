# frozen_string_literal: true

module Sts
  module NisoSts
    class Address < Lutaml::Model::Serializable
      attribute :addr_line, ::Sts::NisoSts::AddrLine, collection: true
      attribute :city, ::Sts::NisoSts::City
      attribute :state, ::Sts::NisoSts::State
      attribute :country, ::Sts::NisoSts::Country
      attribute :postal_code, ::Sts::NisoSts::PostalCode
      attribute :phone, ::Sts::NisoSts::Phone, collection: true
      attribute :fax, ::Sts::NisoSts::Fax, collection: true
      attribute :email, ::Sts::NisoSts::Email, collection: true

      xml do
        element "address"

        map_element "addr-line", to: :addr_line
        map_element "city", to: :city
        map_element "state", to: :state
        map_element "country", to: :country
        map_element "postal-code", to: :postal_code
        map_element "phone", to: :phone
        map_element "fax", to: :fax
        map_element "email", to: :email
      end
    end
  end
end
