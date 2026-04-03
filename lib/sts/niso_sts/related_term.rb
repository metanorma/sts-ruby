# frozen_string_literal: true

module Sts
  module NisoSts
    class RelatedTerm < Lutaml::Model::Serializable
      attribute :related_term_type, :string
      attribute :content, :string

      xml do
        element "related-term"
        mixed_content

        map_attribute "related-term-type", to: :related_term_type
        map_content to: :content
      end
    end
  end
end
