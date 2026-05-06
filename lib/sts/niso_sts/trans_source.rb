# frozen_string_literal: true

module Sts
  module NisoSts
    class TransSource < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true

      xml do
        element "trans-source"
        map_attribute "id", to: :id
        mixed_content

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
      end
    end
  end
end
