# frozen_string_literal: true

module Sts
  module NisoSts
    class SupplVersion < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      xml do
        element "suppl-version"
        map_attribute "id", to: :id
        mixed_content

        map_content to: :content
      end
    end
  end
end
