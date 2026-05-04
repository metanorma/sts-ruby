# frozen_string_literal: true

module Sts
  module NisoSts
    class Collab < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :id, :string
      attribute :collab_alternatives, ::Sts::NisoSts::CollabAlternatives
      attribute :on_behalf_of, :string
      attribute :sc, ::Sts::NisoSts::Sc, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true

      xml do
        element "collab"
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "id", to: :id
        map_element "collab-alternatives", to: :collab_alternatives
        map_element "on-behalf-of", to: :on_behalf_of
        map_element "sc", to: :sc
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "underline", to: :underline
        map_content to: :content
      end
    end
  end
end
