# frozen_string_literal: true

module Sts
  module NisoSts
    class RelatedTerm < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :related_term_type, :string
      attribute :content, :string, collection: true
      xml do
        element "related-term"
        map_attribute "id", to: :id
        mixed_content

        map_attribute "related-term-type", to: :related_term_type
        map_content to: :content
      end
    end
  end
end
