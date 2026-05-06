# frozen_string_literal: true

module Sts
  module IsoSts
    class Xref < Lutaml::Model::Serializable
      attribute :alt, :string
      attribute :id, :string
      attribute :ref_type, :string
      attribute :rid, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :named_content, ::Sts::IsoSts::NamedContent
      attribute :styled_content, ::Sts::IsoSts::StyledContent
      attribute :sub, ::Sts::IsoSts::Sub
      attribute :sup, ::Sts::IsoSts::Sup

      xml do
        element "xref"

        map_attribute "alt", to: :alt
        map_attribute "id", to: :id
        map_attribute "ref-type", to: :ref_type
        map_attribute "rid", to: :rid
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_content to: :content

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "sub", to: :sub
        map_element "sup", to: :sup
      end
    end
  end
end
