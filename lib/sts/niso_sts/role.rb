# frozen_string_literal: true

module Sts
  module NisoSts
    class Role < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true

      xml do
        element "role"
        mixed_content

        map_attribute "content-type", to: :content_type
        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
      end
    end
  end
end
