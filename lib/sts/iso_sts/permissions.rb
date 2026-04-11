# frozen_string_literal: true

module Sts
  module IsoSts
    class Permissions < Lutaml::Model::Serializable
      attribute :copyright_statement, ::Sts::IsoSts::CopyrightStatement,
                collection: true
      attribute :copyright_year, ::Sts::IsoSts::CopyrightYear, collection: true
      attribute :copyright_holder, ::Sts::IsoSts::CopyrightHolder,
                collection: true
      attribute :license, ::Sts::NisoSts::License, collection: true

      xml do
        element "permissions"

        map_element "copyright-statement", to: :copyright_statement
        map_element "copyright-year", to: :copyright_year
        map_element "copyright-holder", to: :copyright_holder
        map_element "license", to: :license
      end
    end
  end
end
