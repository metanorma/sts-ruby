# frozen_string_literal: true

module Sts
  module NisoSts
    class NatMeta < Lutaml::Model::Serializable
      attribute :title_wrap, ::Sts::NisoSts::TitleWrap, collection: true
      attribute :std_ident, ::Sts::NisoSts::StandardIdentification
      attribute :doc_ident, ::Sts::NisoSts::DocumentIdentification
      attribute :std_ref, ::Sts::NisoSts::StandardRef, collection: true
      attribute :doc_ref, :string
      attribute :pub_date, :string
      attribute :release_date, :string
      attribute :release_version, :string
      attribute :comm_ref, :string
      attribute :secretariat, :string
      attribute :ics, :string
      attribute :std_xref, ::Sts::NisoSts::StdCrossReference
      attribute :permissions, ::Sts::NisoSts::Permissions
      attribute :meta_note, ::Sts::NisoSts::MetaNote, collection: true
      attribute :custom_meta_group, ::Sts::NisoSts::CustomMetaGroup,
                collection: true

      xml do
        element "nat-meta"
        ordered

        map_element "title-wrap", to: :title_wrap
        map_element "std-ident", to: :std_ident
        map_element "doc-ident", to: :doc_ident
        map_element "std-ref", to: :std_ref
        map_element "doc-ref", to: :doc_ref
        map_element "pub-date", to: :pub_date
        map_element "release-date", to: :release_date
        map_element "release-version", to: :release_version
        map_element "comm-ref", to: :comm_ref
        map_element "secretariat", to: :secretariat
        map_element "ics", to: :ics
        map_element "std-xref", to: :std_xref
        map_element "permissions", to: :permissions
        map_element "meta-note", to: :meta_note
        map_element "custom-meta-group", to: :custom_meta_group
      end
    end
  end
end
