# frozen_string_literal: true

module Sts
  module NisoSts
    class Collab < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :id, :string
      attribute :collab_alternatives, ::Sts::NisoSts::CollabAlternatives
      attribute :on_behalf_of, :string

      xml do
        element "collab"
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "id", to: :id
        map_element "collab-alternatives", to: :collab_alternatives
        map_element "on-behalf-of", to: :on_behalf_of
        map_content to: :content
      end
    end
  end
end
