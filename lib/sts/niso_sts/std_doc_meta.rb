# frozen_string_literal: true

module Sts
  module NisoSts
    class StdDocMeta < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :std_meta_type, :string
      attribute :std_org_type, :string
      attribute :xml_base, :string
      attribute :xml_lang, :string
      attribute :title_wrap, ::Sts::NisoSts::TitleWrap, collection: true
      attribute :release_version, ::Sts::NisoSts::ReleaseVersion
      attribute :std_ident, ::Sts::NisoSts::StandardIdentification
      attribute :std_org, ::Sts::NisoSts::StdOrg, collection: true
      attribute :std_org_group, ::Sts::NisoSts::StdOrgGroup, collection: true
      attribute :content_language, ::Sts::NisoSts::ContentLanguage,
                collection: true
      attribute :std_ref, ::Sts::NisoSts::StandardRef, collection: true
      attribute :doc_ref, :string
      attribute :pub_date, ::Sts::NisoSts::PubDate
      attribute :release_date, ::Sts::NisoSts::ReleaseDate, collection: true
      attribute :meta_date, ::Sts::NisoSts::MetaDate, collection: true
      attribute :comm_ref, :string, collection: true
      attribute :comm_ref_group, ::Sts::NisoSts::CommRefGroup
      attribute :accrediting_organization, ::Sts::NisoSts::AccreditingOrganization
      attribute :authorization, ::Sts::NisoSts::Authorization
      attribute :secretariat, ::Sts::NisoSts::Secretariat, collection: true
      attribute :ics, ::Sts::NisoSts::Ics, collection: true
      attribute :subj_group, ::Sts::NisoSts::SubjGroup, collection: true
      attribute :page_count, ::Sts::NisoSts::PageCount
      attribute :counts, ::Sts::NisoSts::Counts
      attribute :is_proof, ::Sts::NisoSts::IsProof
      attribute :std_xref, ::Sts::NisoSts::StdCrossReference, collection: true
      attribute :permissions, ::Sts::NisoSts::Permissions, collection: true
      attribute :self_uri, ::Sts::NisoSts::SelfUri, collection: true
      attribute :abstract, ::Sts::NisoSts::Abstract, collection: true
      attribute :kwd_group, ::Sts::NisoSts::KwdGroup, collection: true
      attribute :meta_note, ::Sts::NisoSts::MetaNote, collection: true
      attribute :custom_meta_group, ::Sts::NisoSts::CustomMetaGroup,
                collection: true

      xml do
        element "std-doc-meta"
        ordered

        map_attribute "id", to: :id
        map_attribute "std-meta-type", to: :std_meta_type
        map_attribute "std-org-type", to: :std_org_type
        map_attribute "xml:base", to: :xml_base
        map_attribute "xml:lang", to: :xml_lang

        map_element "title-wrap", to: :title_wrap
        map_element "release-version", to: :release_version
        map_element "std-ident", to: :std_ident
        map_element "std-org", to: :std_org
        map_element "std-org-group", to: :std_org_group
        map_element "content-language", to: :content_language
        map_element "std-ref", to: :std_ref
        map_element "doc-ref", to: :doc_ref
        map_element "pub-date", to: :pub_date
        map_element "release-date", to: :release_date
        map_element "meta-date", to: :meta_date
        map_element "comm-ref", to: :comm_ref
        map_element "comm-ref-group", to: :comm_ref_group
        map_element "accrediting-organization", to: :accrediting_organization
        map_element "authorization", to: :authorization
        map_element "secretariat", to: :secretariat
        map_element "ics", to: :ics
        map_element "subj-group", to: :subj_group
        map_element "page-count", to: :page_count
        map_element "counts", to: :counts
        map_element "is-proof", to: :is_proof
        map_element "std-xref", to: :std_xref
        map_element "permissions", to: :permissions
        map_element "self-uri", to: :self_uri
        map_element "abstract", to: :abstract
        map_element "kwd-group", to: :kwd_group
        map_element "meta-note", to: :meta_note
        map_element "custom-meta-group", to: :custom_meta_group
      end
    end
  end
end
