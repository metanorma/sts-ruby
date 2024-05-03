# frozen_string_literal: true

require_relative "../mapper"

require_relative "std_id_group"

module Sts
  module NisoSts
    class StandardIdentification < Sts::Mapper
      attribute :originator, Shale::Type::String
      attribute :doc_type, Shale::Type::String
      attribute :doc_number, Shale::Type::String
      attribute :edition, Shale::Type::String
      attribute :version, Shale::Type::String
      attribute :part_number, Shale::Type::String
      attribute :std_id_group, StdIdGroup

      xml do
        root "std-iden"

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
