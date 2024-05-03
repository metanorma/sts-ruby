# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module NisoSts
    class DocumentIdentification < Sts::Mapper
      attribute :sdo, Shale::Type::String
      attribute :proj_id, Shale::Type::String
      attribute :language, Shale::Type::String
      attribute :release_version, Shale::Type::String
      attribute :urn, Shale::Type::String

      xml do
        root "doc-iden"

        map_element "sdo", to: :sdo
        map_element "proj-id", to: :proj_id
        map_element "language", to: :language
        map_element "release-version", to: :release_version
        map_element "urn", to: :urn
      end
    end
  end
end
