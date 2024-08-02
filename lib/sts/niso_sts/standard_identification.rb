# frozen_string_literal: true

require_relative "../mapper"

require_relative "std_id_group"

module Sts
  module NisoSts
    class StandardIdentification < Sts::Mapper
      attribute :originator, Lutaml::Model::Type::String
      attribute :doc_type, Lutaml::Model::Type::String
      attribute :doc_number, Lutaml::Model::Type::String
      attribute :edition, Lutaml::Model::Type::String
      attribute :version, Lutaml::Model::Type::String
      attribute :part_number, Lutaml::Model::Type::String
      attribute :std_id_group, StdIdGroup

      xml do
        root "std-ident", mixed: true

        map_element "originator", to: :originator
        map_element "doc-type", to: :doc_type
        map_element "doc-number", to: :doc_number
        map_element "edition", to: :edition, render_nil: true
        map_element "version", to: :version, render_nil: true
        map_element "part-number", to: :part_number
        map_element "std-id-group", to: :std_id_group
      end
    end
  end
end
