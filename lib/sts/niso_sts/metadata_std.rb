# frozen_string_literal: true

require "lutaml/model"
require_relative "title_wrap"
require_relative "document_identification"
require_relative "standard_identification"
require_relative "standard_ref"
require_relative "page_count"
require_relative "std_cross_reference"
require_relative "meta_note"
require_relative "custom_meta_group"
require_relative "permissions"

module Sts
  module NisoSts
    class MetadataStd < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :title_wrap, TitleWrap, collection: true
      attribute :content_language, :string
      attribute :std_ident, StandardIdentification
      attribute :doc_ident, DocumentIdentification
      attribute :std_ref, StandardRef, collection: true
      attribute :doc_ref, :string
      attribute :pub_date, :string
      attribute :release_date, :string
      attribute :release_version, :string
      attribute :comm_ref, :string
      attribute :secretariat, :string
      attribute :page_count, PageCount
      attribute :ics, :string
      attribute :std_xref, StdCrossReference
      attribute :permissions, Permissions
      attribute :meta_note, MetaNote, collection: true
      attribute :custom_meta_group, CustomMetaGroup, collection: true

      xml do
        root "std-meta", mixed: true

        map_attribute "id", to: :id

        map_element "title-wrap", to: :title_wrap
        map_element "content-language", to: :content_language
        map_element "std-ident", to: :std_ident
        map_element "doc-ident", to: :doc_ident
        map_element "std-ref", to: :std_ref
        map_element "doc-ref", to: :doc_ref
        map_element "pub-date", to: :pub_date
        map_element "release-date", to: :release_date
        map_element "release-version", to: :release_version
        map_element "comm-ref", to: :comm_ref, render_nil: true
        map_element "secretariat", to: :secretariat, render_nil: true
        map_element "page-count", to: :page_count
        map_element "ics", to: :ics
        map_element "std-xref", to: :std_xref
        map_element "permissions", to: :permissions
        map_element "meta-note", to: :meta_note
        map_element "custom-meta-group", to: :custom_meta_group
      end
    end
  end
end
