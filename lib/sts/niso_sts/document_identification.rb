# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class DocumentIdentification < Lutaml::Model::Serializable
      attribute :sdo, Lutaml::Model::Type::String
      attribute :proj_id, Lutaml::Model::Type::String
      attribute :language, Lutaml::Model::Type::String
      attribute :release_version, Lutaml::Model::Type::String
      attribute :urn, Lutaml::Model::Type::String

      xml do
        root "doc-ident"

        map_element "sdo", to: :sdo
        map_element "proj-id", to: :proj_id
        map_element "language", to: :language
        map_element "release-version", to: :release_version
        map_element "urn", to: :urn
      end
    end
  end
end
