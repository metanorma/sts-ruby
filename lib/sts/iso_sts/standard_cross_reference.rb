# frozen_string_literal: true

module Sts
  module IsoSts
    class StandardCrossReference < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :type, :string
      attribute :std_ident, ::Sts::IsoSts::StandardIdentification
      attribute :std_ref, ::Sts::IsoSts::StandardRef
      attribute :release_date, ::Sts::IsoSts::ReleaseDate

      xml do
        element "std-xref"
        map_attribute "id", to: :id
        ordered

        map_attribute "type", to: :type

        map_element "std-ident", to: :std_ident
        map_element "std-ref", to: :std_ref
        map_element "release-date", to: :release_date
      end
    end
  end
end
