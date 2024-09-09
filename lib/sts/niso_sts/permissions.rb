# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class Permissions < Lutaml::Model::Serializable
      attribute :copyright_statement, Lutaml::Model::Type::String
      attribute :copyright_year, Lutaml::Model::Type::String
      attribute :copyright_holder, Lutaml::Model::Type::String

      xml do
        root "permissions"
        map_element "copyright-statement", to: :copyright_statement
        map_element "copyright-year", to: :copyright_year
        map_element "copyright-holder", to: :copyright_holder
      end
    end
  end
end
