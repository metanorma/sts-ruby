# frozen_string_literal: true

module Sts
  module NisoSts
    class OnBehalfOf < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true

      xml do
        element "on-behalf-of"
        mixed_content

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
      end
    end
  end
end
