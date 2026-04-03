# frozen_string_literal: true

module Sts
  module NisoSts
    class ReleaseVersionId < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "release-version-id"
        mixed_content

        map_content to: :content
      end
    end
  end
end
