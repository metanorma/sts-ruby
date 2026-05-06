# frozen_string_literal: true

module Sts
  module IsoSts
    class NatMeta < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :originator, :string
      attribute :title_wrap, ::Sts::IsoSts::TitleWrap, collection: true
      attribute :doc_ident, ::Sts::IsoSts::DocumentIdentification
      attribute :std_ident, ::Sts::IsoSts::StandardIdentification
      attribute :content_language, ::Sts::IsoSts::ContentLanguage,
                collection: true
      attribute :std_ref, ::Sts::IsoSts::StandardRef, collection: true
      attribute :doc_ref, :string
      attribute :release_date, ::Sts::IsoSts::ReleaseDate
      attribute :comm_ref, :string
      attribute :secretariat, ::Sts::NisoSts::Secretariat, collection: true
      attribute :ics, ::Sts::NisoSts::Ics, collection: true
      attribute :page_count, ::Sts::IsoSts::PageCount
      attribute :permissions, ::Sts::IsoSts::Permissions, collection: true
      attribute :std_xref, ::Sts::IsoSts::StandardCrossReference,
                collection: true
      attribute :custom_meta_group, ::Sts::NisoSts::CustomMetaGroup,
                collection: true
      attribute :meta_date, ::Sts::IsoSts::MetaDate, collection: true
      attribute :pub_date, ::Sts::NisoSts::PubDate

      xml do
        element "nat-meta"
        ordered

        map_attribute "id", to: :id
        map_attribute "originator", to: :originator

        map_element "title-wrap", to: :title_wrap
        map_element "doc-ident", to: :doc_ident
        map_element "std-ident", to: :std_ident
        map_element "content-language", to: :content_language
        map_element "std-ref", to: :std_ref
        map_element "doc-ref", to: :doc_ref
        map_element "release-date", to: :release_date
        map_element "comm-ref", to: :comm_ref
        map_element "secretariat", to: :secretariat
        map_element "ics", to: :ics
        map_element "page-count", to: :page_count
        map_element "permissions", to: :permissions
        map_element "std-xref", to: :std_xref
        map_element "custom-meta-group", to: :custom_meta_group
        map_element "meta-date", to: :meta_date
        map_element "pub-date", to: :pub_date
      end
    end
  end
end
