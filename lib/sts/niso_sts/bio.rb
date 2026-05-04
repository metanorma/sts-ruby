# frozen_string_literal: true

module Sts
  module NisoSts
    class Bio < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :paragraph, ::Sts::NisoSts::Paragraph, collection: true

      xml do
        element "bio"
        ordered

        map_attribute "id", to: :id
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "p", to: :paragraph
      end
    end
  end
end
