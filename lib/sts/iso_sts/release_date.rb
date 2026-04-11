# frozen_string_literal: true

module Sts
  module IsoSts
    class ReleaseDate < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "release-date"
        mixed_content

        map_content to: :content
      end
    end
  end
end
