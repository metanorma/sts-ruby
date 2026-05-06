# frozen_string_literal: true

module Sts
  module NisoSts
    class Comment < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      xml do
        element "comment"
        map_attribute "id", to: :id
        mixed_content

        map_content to: :content
      end
    end
  end
end
