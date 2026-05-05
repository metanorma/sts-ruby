# frozen_string_literal: true

module Sts
  module NisoSts
    class Sup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true
      attribute :monospace, ::Sts::NisoSts::Monospace, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true

      xml do
        element "sup"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "underline", to: :underline
        map_element "monospace", to: :monospace
        map_element "styled-content", to: :styled_content
        map_element "xref", to: :xref
      end
    end
  end
end
