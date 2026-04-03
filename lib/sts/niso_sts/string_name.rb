# frozen_string_literal: true

module Sts
  module NisoSts
    class StringName < Lutaml::Model::Serializable
      attribute :name_style, :string
      attribute :content_type, :string
      attribute :content, :string
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true

      xml do
        element "string-name"
        mixed_content

        map_attribute "name-style", to: :name_style
        map_attribute "content-type", to: :content_type
        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
      end
    end
  end
end
