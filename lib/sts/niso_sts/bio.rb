# frozen_string_literal: true

module Sts
  module NisoSts
    class Bio < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string
      attribute :bold, :string, collection: true
      attribute :italic, :string, collection: true
      attribute :paragraph, ::Sts::NisoSts::Paragraph, collection: true

      xml do
        element "bio"
        mixed_content

        map_attribute "id", to: :id
        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "p", to: :paragraph
      end
    end
  end
end
