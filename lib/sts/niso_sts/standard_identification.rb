# frozen_string_literal: true

require "shale"

module Sts
  module NisoSts
    class StandardIdentification < Shale::Mapper
      attribute :originator, Shale::Type::String
      attribute :doc_type, Shale::Type::String
      attribute :doc_number, Shale::Type::String
      attribute :edition, Shale::Type::String
      attribute :version, Shale::Type::String

      xml do
        root "std-iden"

        map_element "originator", to: :originator
        map_element "doc-type", to: :doc_type
        map_element "doc-number", to: :doc_number
        map_element "edition", to: :edition
        map_element "version", to: :version
      end
    end
  end
end
