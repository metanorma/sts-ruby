# frozen_string_literal: true

module Sts
  module IsoSts
    class DocRef < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      xml do
        element "doc-ref"
        map_attribute "id", to: :id
        mixed_content

        map_content to: :content
      end
    end
  end
end
