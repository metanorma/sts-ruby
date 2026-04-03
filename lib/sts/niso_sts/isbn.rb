# frozen_string_literal: true

module Sts
  module NisoSts
    class Isbn < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :bold, :string, collection: true
      attribute :italic, :string, collection: true

      xml do
        element "isbn"
        mixed_content

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
      end
    end
  end
end
