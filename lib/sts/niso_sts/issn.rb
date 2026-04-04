# frozen_string_literal: true

module Sts
  module NisoSts
    class Issn < Lutaml::Model::Serializable
      attribute :pub_type, :string
      attribute :content, :string
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true

      xml do
        element "issn"
        mixed_content

        map_attribute "pub-type", to: :pub_type
        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
      end
    end
  end
end
