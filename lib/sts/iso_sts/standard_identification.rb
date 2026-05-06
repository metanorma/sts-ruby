# frozen_string_literal: true

module Sts
  module IsoSts
    class StandardIdentification < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :originator, ::Sts::NisoSts::Originator
      attribute :doc_type, ::Sts::NisoSts::DocType
      attribute :doc_number, ::Sts::NisoSts::DocNumber
      attribute :part_number, ::Sts::NisoSts::PartNumber
      attribute :edition, ::Sts::IsoSts::Edition
      attribute :version, ::Sts::NisoSts::Version
      attribute :suppl_type, ::Sts::NisoSts::SupplType
      attribute :suppl_number, ::Sts::NisoSts::SupplNumber
      attribute :suppl_version, ::Sts::NisoSts::SupplVersion

      xml do
        element "std-ident"
        map_attribute "id", to: :id
        ordered

        map_element "originator", to: :originator
        map_element "doc-type", to: :doc_type
        map_element "doc-number", to: :doc_number
        map_element "part-number", to: :part_number
        map_element "edition", to: :edition
        map_element "version", to: :version
        map_element "suppl-type", to: :suppl_type
        map_element "suppl-number", to: :suppl_number
        map_element "suppl-version", to: :suppl_version
      end
    end
  end
end
