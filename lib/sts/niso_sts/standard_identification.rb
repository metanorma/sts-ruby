# frozen_string_literal: true

require "lutaml/model"

require_relative "std_id_group"

module Sts
  module NisoSts
    class StandardIdentification < Lutaml::Model::Serializable
      attribute :originator, :string
      attribute :doc_type, :string
      attribute :doc_number, :string
      attribute :edition, :string
      attribute :version, :string
      attribute :part_number, :string
      attribute :std_id_group, StdIdGroup

      xml do
        root "std-ident", mixed: true

        map_element "originator", to: :originator
        map_element "doc-type", to: :doc_type
        map_element "doc-number", to: :doc_number
        map_element "edition", to: :edition,
                               value_map: { to: { empty: :empty } }
        map_element "version", to: :version,
                               value_map: { to: { empty: :empty } }
        map_element "part-number", to: :part_number
        map_element "std-id-group", to: :std_id_group
      end
    end
  end
end
