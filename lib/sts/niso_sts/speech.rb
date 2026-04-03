# frozen_string_literal: true

module Sts
  module NisoSts
    class Speech < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :speaker, ::Sts::NisoSts::Speaker
      attribute :paragraphs, ::Sts::NisoSts::Paragraph, collection: true

      xml do
        element "speech"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use

        map_element "speaker", to: :speaker
        map_element "p", to: :paragraphs
      end
    end
  end
end
