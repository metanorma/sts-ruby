# frozen_string_literal: true

module Sts
  module IsoSts
    class DocRef < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "doc-ref"
        mixed_content

        map_content to: :content
      end
    end
  end
end
