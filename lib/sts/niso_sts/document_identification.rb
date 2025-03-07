# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class DocumentIdentification < Lutaml::Model::Serializable
      attribute :sdo, :string
      attribute :proj_id, :string
      attribute :language, :string
      attribute :release_version, :string
      attribute :urn, :string

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
