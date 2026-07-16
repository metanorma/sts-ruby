# frozen_string_literal: true

module Sts
  module IsoSts
    class StdRef < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :type, :string
      attribute :originator, ::Sts::IsoSts::Originator
      attribute :doc_type, ::Sts::IsoSts::DocType
      attribute :doc_number, ::Sts::IsoSts::DocNumber
      attribute :part_number, ::Sts::IsoSts::PartNumber
      attribute :edition, ::Sts::IsoSts::Edition
      attribute :suppl_type, ::Sts::IsoSts::SupplType
      attribute :suppl_number, ::Sts::IsoSts::SupplNumber
      attribute :year, ::Sts::NisoSts::Year
      attribute :content, :string, collection: true
      xml do
        element "std-ref"
        map_attribute "id", to: :id
        mixed_content

        map_attribute "type", to: :type

        map_element "originator", to: :originator
        map_element "doc-type", to: :doc_type
        map_element "doc-number", to: :doc_number
        map_element "part-number", to: :part_number
        map_element "edition", to: :edition
        map_element "suppl-type", to: :suppl_type
        map_element "suppl-number", to: :suppl_number
        map_element "year", to: :year
        map_content to: :content
      end
    end
  end
end
