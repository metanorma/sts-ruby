# frozen_string_literal: true

module Sts
  module NisoSts
    class MetadataStd < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :std_meta_type, :string
      attribute :title_wrap, ::Sts::NisoSts::TitleWrap, collection: true
      attribute :content_language, :string
      attribute :std_ident, ::Sts::NisoSts::StandardIdentification
      attribute :doc_ident, ::Sts::NisoSts::DocumentIdentification
      attribute :std_ref, ::Sts::NisoSts::StandardRef, collection: true
      attribute :doc_ref, :string
      attribute :pub_date, :string
      attribute :proj_id, ::Sts::NisoSts::ProjId
      attribute :release_date, ::Sts::NisoSts::ReleaseDate, collection: true
      attribute :release_version, ::Sts::NisoSts::ReleaseVersion
      attribute :std_org, ::Sts::NisoSts::StdOrg, collection: true
      attribute :std_org_group, ::Sts::NisoSts::StdOrgGroup
      attribute :comm_ref, :string
      attribute :secretariat, :string
      attribute :ics, :string, collection: true
      attribute :page_count, ::Sts::NisoSts::PageCount
      attribute :std_xref, ::Sts::NisoSts::StdCrossReference, collection: true
      attribute :permissions, ::Sts::NisoSts::Permissions, collection: true
      attribute :self_uri, ::Sts::NisoSts::SelfUri
      attribute :meta_note, ::Sts::NisoSts::MetaNote, collection: true
      attribute :custom_meta_group, ::Sts::NisoSts::CustomMetaGroup,
                collection: true

      xml do
        element "std-meta"
        ordered

        map_attribute "id", to: :id
        map_attribute "std-meta-type", to: :std_meta_type

        map_element "title-wrap", to: :title_wrap
        map_element "content-language", to: :content_language
        map_element "std-ident", to: :std_ident
        map_element "doc-ident", to: :doc_ident
        map_element "std-ref", to: :std_ref
        map_element "doc-ref", to: :doc_ref
        map_element "pub-date", to: :pub_date
        map_element "proj-id", to: :proj_id
        map_element "release-date", to: :release_date
        map_element "release-version", to: :release_version
        map_element "std-org", to: :std_org
        map_element "std-org-group", to: :std_org_group
        map_element "comm-ref", to: :comm_ref,
                                value_map: { to: { empty: :empty } }
        map_element "secretariat", to: :secretariat,
                                   value_map: { to: { empty: :empty } }
        map_element "ics", to: :ics
        map_element "page-count", to: :page_count
        map_element "std-xref", to: :std_xref
        map_element "permissions", to: :permissions
        map_element "self-uri", to: :self_uri
        map_element "meta-note", to: :meta_note
        map_element "custom-meta-group", to: :custom_meta_group
      end
    end
  end
end
