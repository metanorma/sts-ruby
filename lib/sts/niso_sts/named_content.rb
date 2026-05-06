# frozen_string_literal: true

module Sts
  module NisoSts
    class NamedContent < Lutaml::Model::Serializable
      attribute :alt, :string
      attribute :content_type, :string
      attribute :id, :string
      attribute :rid, :string
      attribute :specific_use, :string
      attribute :vocab, :string
      attribute :vocab_identifier, :string
      attribute :vocab_term, :string
      attribute :vocab_term_identifier, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :inline_graphic, ::Sts::NisoSts::InlineGraphic, collection: true
      attribute :private_char, ::Sts::NisoSts::PrivateChar, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :fn, ::Sts::NisoSts::Fn, collection: true
      attribute :target, ::Sts::NisoSts::Target, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true

      xml do
        element "named-content"
        mixed_content

        map_attribute "alt", to: :alt
        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "rid", to: :rid
        map_attribute "specific-use", to: :specific_use
        map_attribute "vocab", to: :vocab
        map_attribute "vocab-identifier", to: :vocab_identifier
        map_attribute "vocab-term", to: :vocab_term
        map_attribute "vocab-term-identifier", to: :vocab_term_identifier
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "ext-link", to: :ext_link
        map_element "inline-graphic", to: :inline_graphic
        map_element "private-char", to: :private_char
        map_element "styled-content", to: :styled_content
        map_element "fn", to: :fn
        map_element "target", to: :target
        map_element "xref", to: :xref
      end
    end
  end
end
