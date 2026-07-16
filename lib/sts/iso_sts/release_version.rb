# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <release-version> as type="xs:string" -- no attributes.
    class ReleaseVersion < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "release-version"

        map_content to: :content
      end
    end
  end
end
