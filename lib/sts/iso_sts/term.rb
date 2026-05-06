# frozen_string_literal: true

module Sts
  module IsoSts
    class Term < Lutaml::Model::Serializable
      attribute :rid, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :sub, ::Sts::NisoSts::Sub
      attribute :sup, ::Sts::NisoSts::Sup
      attribute :xref, ::Sts::TbxIsoTml::Xref
      attribute :ext_link, ::Sts::NisoSts::ExtLink
      attribute :uri, ::Sts::NisoSts::Uri
      attribute :named_content, ::Sts::NisoSts::NamedContent
      attribute :styled_content, ::Sts::IsoSts::StyledContent
      attribute :math, Mml::V3::Math

      xml do
        element "term"
        mixed_content

        map_attribute "rid", to: :rid
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_content to: :content

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "xref", to: :xref
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "math", to: :math
      end
    end
  end
end
