# frozen_string_literal: true

require_relative "../mapper"

require_relative "custom_meta_group"
require_relative "document_identification"
require_relative "meta_date"
require_relative "page_count"
require_relative "permissions"
require_relative "standard_identification"
require_relative "standard_ref"
require_relative "std_cross_reference"
require_relative "title_wrap"

module Sts
  module NisoSts
    class MetadataIso < Sts::Mapper
      attribute :comm_ref, Lutaml::Model::Type::String
      attribute :content_language, Lutaml::Model::Type::String
      attribute :custom_meta_group, CustomMetaGroup
      attribute :doc_ident, DocumentIdentification
      attribute :doc_ref, Lutaml::Model::Type::String
      attribute :ics, Lutaml::Model::Type::String
      attribute :meta_date, MetaDate
      attribute :page_count, PageCount
      attribute :permissions, Permissions
      attribute :pub_date, Lutaml::Model::Type::String
      attribute :release_date, Lutaml::Model::Type::String
      attribute :secretariat, Lutaml::Model::Type::String
      attribute :std_ident, StandardIdentification
      attribute :std_ref, StandardRef
      attribute :std_xref, StdCrossReference
      attribute :title_wrap, TitleWrap

      xml do
        root "iso-meta", mixed: true

        map_element "comm-ref", to: :comm_ref
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
