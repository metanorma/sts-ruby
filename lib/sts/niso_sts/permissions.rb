# frozen_string_literal: true

module Sts
  module NisoSts
    class Permissions < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :copyright_statement, :string
      attribute :copyright_year, :string
      attribute :copyright_holder, :string, collection: true
      attribute :license, ::Sts::NisoSts::License, collection: true

      xml do
        element "permissions"
        map_attribute "id", to: :id
        ordered

        map_element "copyright-statement", to: :copyright_statement
        map_element "copyright-year", to: :copyright_year
        map_element "copyright-holder", to: :copyright_holder
        map_element "license", to: :license
      end
    end
  end
end
