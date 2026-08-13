# frozen_string_literal: true

module Sts
  module IsoSts
    class TransSource < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :email, ::Sts::IsoSts::Email, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :monospace, ::Sts::IsoSts::Monospace, collection: true
      attribute :num, ::Sts::IsoSts::Num, collection: true
      attribute :overline, ::Sts::IsoSts::Overline, collection: true
      attribute :roman, ::Sts::IsoSts::Roman, collection: true
      attribute :sans_serif, ::Sts::IsoSts::SansSerif, collection: true
      attribute :sc, ::Sts::IsoSts::Sc, collection: true
      attribute :strike, ::Sts::IsoSts::Strike, collection: true
      attribute :underline, ::Sts::IsoSts::Underline, collection: true
      attribute :named_content, ::Sts::IsoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :sub, ::Sts::IsoSts::Sub, collection: true
      attribute :sup, ::Sts::IsoSts::Sup, collection: true

      xml do
        element "trans-source"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "monospace", to: :monospace
        map_element "num", to: :num
        map_element "overline", to: :overline
        map_element "roman", to: :roman
        map_element "sans-serif", to: :sans_serif
        map_element "sc", to: :sc
        map_element "strike", to: :strike
        map_element "underline", to: :underline
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "sub", to: :sub
        map_element "sup", to: :sup
      end
    end
  end
end
