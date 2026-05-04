# frozen_string_literal: true

module Sts
  module NisoSts
    class MetadataIso < Lutaml::Model::Serializable
      attribute :comm_ref, :string
      attribute :content_language, :string
      attribute :custom_meta_group, ::Sts::NisoSts::CustomMetaGroup
      attribute :doc_ident, ::Sts::NisoSts::DocumentIdentification
      attribute :doc_ref, :string
      attribute :ics, :string
      attribute :meta_date, ::Sts::NisoSts::MetaDate
      attribute :page_count, ::Sts::NisoSts::PageCount
      attribute :permissions, ::Sts::NisoSts::Permissions
      attribute :pub_date, :string
      attribute :release_date, :string
      attribute :secretariat, :string
      attribute :std_ident, ::Sts::NisoSts::StandardIdentification
      attribute :std_ref, ::Sts::NisoSts::StandardRef
      attribute :std_xref, ::Sts::NisoSts::StdCrossReference
      attribute :title_wrap, ::Sts::NisoSts::TitleWrap

      xml do
        element "iso-meta"
        ordered

        map_element "comm-ref", to: :comm_ref,
                                value_map: { to: { empty: :empty } }
        map_element "content-language", to: :content_language
        map_element "custom-meta-group", to: :custom_meta_group
        map_element "doc-ident", to: :doc_ident
        map_element "doc-ref", to: :doc_ref
        map_element "ics", to: :ics
        map_element "meta-date", to: :meta_date
        map_element "page-count", to: :page_count
        map_element "permissions", to: :permissions
        map_element "pub-date", to: :pub_date
        map_element "release-date", to: :release_date
        map_element "secretariat", to: :secretariat
        map_element "std-ident", to: :std_ident
        map_element "std-ref", to: :std_ref
        map_element "std-xref", to: :std_xref
        map_element "title-wrap", to: :title_wrap
      end
    end
  end
end
