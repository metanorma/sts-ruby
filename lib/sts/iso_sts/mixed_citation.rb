# frozen_string_literal: true

module Sts
  module IsoSts
    class MixedCitation < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :publication_type, :string
      attribute :publisher_type, :string
      attribute :publication_format, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :sub, ::Sts::IsoSts::Sub, collection: true
      attribute :sup, ::Sts::IsoSts::Sup, collection: true
      attribute :std, ::Sts::IsoSts::Std, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :named_content, ::Sts::IsoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :fn, ::Sts::TbxIsoTml::Fn, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :break, ::Sts::IsoSts::Break, collection: true
      attribute :person_group, ::Sts::NisoSts::PersonGroup, collection: true
      attribute :collab, ::Sts::NisoSts::Collab, collection: true
      attribute :year, ::Sts::NisoSts::Year, collection: true
      attribute :source, ::Sts::NisoSts::Source
      attribute :article_title, ::Sts::NisoSts::ArticleTitle
      attribute :volume, ::Sts::NisoSts::Volume
      attribute :issue, ::Sts::NisoSts::Issue
      attribute :fpage, ::Sts::NisoSts::Fpage
      attribute :lpage, ::Sts::NisoSts::Lpage
      attribute :page_range, ::Sts::NisoSts::PageRange
      attribute :publisher, ::Sts::NisoSts::Publisher
      attribute :pub_id, ::Sts::NisoSts::PubId, collection: true

      xml do
        element "mixed-citation"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "publication-type", to: :publication_type
        map_attribute "publisher-type", to: :publisher_type
        map_attribute "publication-format", to: :publication_format
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_content to: :content

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "std", to: :std
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "fn", to: :fn
        map_element "xref", to: :xref
        map_element "break", to: :break
        map_element "person-group", to: :person_group
        map_element "collab", to: :collab
        map_element "year", to: :year
        map_element "source", to: :source
        map_element "article-title", to: :article_title
        map_element "volume", to: :volume
        map_element "issue", to: :issue
        map_element "fpage", to: :fpage
        map_element "lpage", to: :lpage
        map_element "page-range", to: :page_range
        map_element "publisher", to: :publisher
        map_element "pub-id", to: :pub_id
      end
    end
  end
end
