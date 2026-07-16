# frozen_string_literal: true

module Sts
  module IsoSts
    class DocumentIdentification < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :sdo, ::Sts::IsoSts::Sdo
      attribute :proj_id, ::Sts::IsoSts::ProjId
      attribute :language, ::Sts::IsoSts::Language
      attribute :release_version, ::Sts::IsoSts::ReleaseVersion
      attribute :urn, ::Sts::IsoSts::Urn

      xml do
        element "doc-ident"
        map_attribute "id", to: :id
        ordered

        map_element "sdo", to: :sdo
        map_element "proj-id", to: :proj_id
        map_element "language", to: :language
        map_element "release-version", to: :release_version
        map_element "urn", to: :urn
      end
    end
  end
end
