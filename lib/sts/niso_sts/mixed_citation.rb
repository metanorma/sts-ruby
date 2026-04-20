# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
module Sts
  module NisoSts
    class MixedCitation < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :publication_type, :string
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :person_group, ::Sts::NisoSts::PersonGroup, collection: true
      attribute :article_title, ::Sts::NisoSts::ArticleTitle
      attribute :source, ::Sts::NisoSts::Source
      attribute :trans_source, ::Sts::NisoSts::TransSource
      attribute :chapter_title, ::Sts::NisoSts::ChapterTitle
      attribute :data_title, ::Sts::NisoSts::DataTitle
      attribute :trans_title, ::Sts::NisoSts::TransTitle
      attribute :trans_title_group, ::Sts::NisoSts::TransTitleGroup
      attribute :edition, ::Sts::NisoSts::Edition
      attribute :volume, ::Sts::NisoSts::Volume
      attribute :issue, ::Sts::NisoSts::Issue
      attribute :pub_id, ::Sts::NisoSts::PubId, collection: true
      attribute :isbn, ::Sts::NisoSts::Isbn
      attribute :issn, ::Sts::NisoSts::Issn
      attribute :issn_l, ::Sts::NisoSts::IssnL
      attribute :fpage, ::Sts::NisoSts::Fpage
      attribute :lpage, ::Sts::NisoSts::Lpage
      attribute :page_range, ::Sts::NisoSts::PageRange
      attribute :elocation_id, ::Sts::NisoSts::ElocationId
      attribute :date, ::Sts::NisoSts::Date
      attribute :date_in_citation, ::Sts::NisoSts::DateInCitation
      attribute :access_date, ::Sts::NisoSts::AccessDate
      attribute :time_stamp, ::Sts::NisoSts::TimeStamp
      attribute :conf_name, ::Sts::NisoSts::ConfName
      attribute :conf_date, ::Sts::NisoSts::ConfDate
      attribute :conf_loc, ::Sts::NisoSts::ConfLoc
      attribute :conference, ::Sts::NisoSts::Conference
      attribute :size, ::Sts::NisoSts::Size
      attribute :series, ::Sts::NisoSts::Series
      attribute :series_title, ::Sts::NisoSts::SeriesTitle
      attribute :series_text, ::Sts::NisoSts::SeriesText
      attribute :comment, ::Sts::NisoSts::Comment
      attribute :annotation, ::Sts::NisoSts::Annotation
      attribute :patent, ::Sts::NisoSts::Patent
      attribute :gov, ::Sts::NisoSts::Gov
      attribute :aff, ::Sts::NisoSts::Aff, collection: true
      attribute :aff_alternatives, ::Sts::NisoSts::AffAlternatives
      attribute :collab, ::Sts::NisoSts::Collab, collection: true
      attribute :etal, ::Sts::NisoSts::Etal
      attribute :name, ::Sts::NisoSts::Name, collection: true
      attribute :name_alternatives, ::Sts::NisoSts::NameAlternatives
      attribute :string_name, ::Sts::NisoSts::StringName, collection: true
      attribute :institution_wrap, ::Sts::NisoSts::InstitutionWrap
      attribute :institution, ::Sts::NisoSts::Institution, collection: true
      attribute :publisher, ::Sts::NisoSts::Publisher
      attribute :price, :string

      xml do
        element "mixed-citation"
        mixed_content

        map_content to: :content
        map_attribute "publication-type", to: :publication_type

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "std", to: :std
        map_element "ext-link", to: :ext_link
        map_element "person-group", to: :person_group
        map_element "article-title", to: :article_title
        map_element "source", to: :source
        map_element "trans-source", to: :trans_source
        map_element "chapter-title", to: :chapter_title
        map_element "data-title", to: :data_title
        map_element "trans-title", to: :trans_title
        map_element "trans-title-group", to: :trans_title_group
        map_element "edition", to: :edition
        map_element "volume", to: :volume
        map_element "issue", to: :issue
        map_element "pub-id", to: :pub_id
        map_element "isbn", to: :isbn
        map_element "issn", to: :issn
        map_element "issn-l", to: :issn_l
        map_element "fpage", to: :fpage
        map_element "lpage", to: :lpage
        map_element "page-range", to: :page_range
        map_element "elocation-id", to: :elocation_id
        map_element "date", to: :date
        map_element "date-in-citation", to: :date_in_citation
        map_element "access-date", to: :access_date
        map_element "time-stamp", to: :time_stamp
        map_element "conf-name", to: :conf_name
        map_element "conf-date", to: :conf_date
        map_element "conf-loc", to: :conf_loc
        map_element "conference", to: :conference
        map_element "size", to: :size
        map_element "series", to: :series
        map_element "series-title", to: :series_title
        map_element "series-text", to: :series_text
        map_element "comment", to: :comment
        map_element "annotation", to: :annotation
        map_element "patent", to: :patent
        map_element "gov", to: :gov
        map_element "aff", to: :aff
        map_element "aff-alternatives", to: :aff_alternatives
        map_element "collab", to: :collab
        map_element "etal", to: :etal
        map_element "name", to: :name
        map_element "name-alternatives", to: :name_alternatives
        map_element "string-name", to: :string_name
        map_element "institution-wrap", to: :institution_wrap
        map_element "institution", to: :institution
        map_element "publisher", to: :publisher
        map_element "price", to: :price
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
