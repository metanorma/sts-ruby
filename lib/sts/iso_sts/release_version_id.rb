# frozen_string_literal: true

module Sts
  module IsoSts
    class ReleaseVersionId < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :id, :string

      xml do
        element "release-version-id"

        map_content to: :content
        map_attribute "id", to: :id
      end
    end
  end
end
