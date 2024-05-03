# frozen_string_literal: true

require_relative "../mapper"
require_relative "title_wrap"
require_relative "document_identification"
require_relative "standard_identification"
require_relative "standard_ref"
require_relative "page_count"

module Sts
  module NisoSts
    class MetadataIso < Sts::Mapper
      attribute :title_wrap, TitleWrap
      attribute :content_language, Shale::Type::String
      attribute :std_ident, StandardIdentification
      attribute :doc_ident, DocumentIdentification
      attribute :std_ref, StandardRef
      attribute :doc_ref, Shale::Type::String
      attribute :pub_date, Shale::Type::String
      attribute :release_date, Shale::Type::String
      attribute :comm_ref, Shale::Type::String
      attribute :secretariat, Shale::Type::String
      attribute :page_count, PageCount

      xml do
        root "iso-meta"
        map_element "title-wrap", to: :title_wrap
        map_element "content-language", to: :content_language
        map_element "std-ident", to: :std_ident
        map_element "doc-ident", to: :doc_ident
        map_element "std-ref", to: :std_ref
        map_element "doc-ref", to: :doc_ref
        map_element "pub-date", to: :pub_date
        map_element "release-date", to: :release_date
        map_element "comm-ref", to: :comm_ref
        map_element "secretariat", to: :secretariat
        map_element "page-count", to: :page_count
      end
    end
  end
end
