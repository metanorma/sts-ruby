# frozen_string_literal: true

module Sts
  module NisoSts
    class CompoundSubjectPart < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :xml_base, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :inline_graphic, ::Sts::NisoSts::InlineGraphic, collection: true
      attribute :private_char, ::Sts::NisoSts::PrivateChar, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true

      xml do
        element "compound-subject-part"
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "xml:base", to: :xml_base

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "inline-graphic", to: :inline_graphic
        map_element "private-char", to: :private_char
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
      end
    end
  end
end
