# frozen_string_literal: true

# Shared method to inject citation-elements content group into a model class.
# This is the set of child elements shared by ElementCitation and NlmCitation.
#
# Call inside the class body:
#
#   ContentGroups.citation_elements(self)
#
# And inside xml do ... end:
#
#   ContentGroups.citation_elements_mappings(self)

module Sts
  module NisoSts
    module ContentGroups
      # 4-tuple: [ruby_name, type_class_name, xml_element_name, collection?]
      CITATION_ELEMENTS = [
        [:publisher, "Sts::NisoSts::Publisher", "publisher", false],
        [:person_group, "Sts::NisoSts::PersonGroup", "person-group", true],
        [:article_title, "Sts::NisoSts::ArticleTitle", "article-title", false],
        [:source, "Sts::NisoSts::Source", "source", false],
        [:trans_source, "Sts::NisoSts::TransSource", "trans-source", false],
        [:chapter_title, "Sts::NisoSts::ChapterTitle", "chapter-title", false],
        [:data_title, "Sts::NisoSts::DataTitle", "data-title", false],
        [:trans_title, "Sts::NisoSts::TransTitle", "trans-title", false],
        [:trans_title_group, "Sts::NisoSts::TransTitleGroup",
         "trans-title-group", false],
        [:edition, "Sts::NisoSts::Edition", "edition", false],
        [:volume, "Sts::NisoSts::Volume", "volume", false],
        [:issue, "Sts::NisoSts::Issue", "issue", false],
        [:pub_id, "Sts::NisoSts::PubId", "pub-id", true],
        [:isbn, "Sts::NisoSts::Isbn", "isbn", false],
        [:issn, "Sts::NisoSts::Issn", "issn", false],
        [:issn_l, "Sts::NisoSts::IssnL", "issn-l", false],
        [:fpage, "Sts::NisoSts::Fpage", "fpage", false],
        [:lpage, "Sts::NisoSts::Lpage", "lpage", false],
        [:page_range, "Sts::NisoSts::PageRange", "page-range", false],
        [:elocation_id, "Sts::NisoSts::ElocationId", "elocation-id", false],
        [:date, "Sts::NisoSts::Date", "date", false],
        [:date_in_citation, "Sts::NisoSts::DateInCitation", "date-in-citation",
         false],
        [:access_date, "Sts::NisoSts::AccessDate", "access-date", false],
        [:time_stamp, "Sts::NisoSts::TimeStamp", "time-stamp", false],
        [:conf_name, "Sts::NisoSts::ConfName", "conf-name", false],
        [:conf_date, "Sts::NisoSts::ConfDate", "conf-date", false],
        [:conf_loc, "Sts::NisoSts::ConfLoc", "conf-loc", false],
        [:conference, "Sts::NisoSts::Conference", "conference", false],
        [:size, "Sts::NisoSts::Size", "size", false],
        [:series, "Sts::NisoSts::Series", "series", false],
        [:series_title, "Sts::NisoSts::SeriesTitle", "series-title", false],
        [:series_text, "Sts::NisoSts::SeriesText", "series-text", false],
        [:comment, "Sts::NisoSts::Comment", "comment", false],
        [:annotation, "Sts::NisoSts::Annotation", "annotation", false],
        [:patent, "Sts::NisoSts::Patent", "patent", false],
        [:gov, "Sts::NisoSts::Gov", "gov", false],
        [:aff, "Sts::NisoSts::Aff", "aff", true],
        [:aff_alternatives, "Sts::NisoSts::AffAlternatives",
         "aff-alternatives", false],
        [:collab, "Sts::NisoSts::Collab", "collab", true],
        [:etal, "Sts::NisoSts::Etal", "etal", false],
        [:ext_link, "Sts::NisoSts::ExtLink", "ext-link", true],
      ].freeze

      def self.citation_elements(klass)
        inject_elements(klass, CITATION_ELEMENTS)
      end

      def self.citation_elements_mappings(klass)
        inject_element_mappings(klass, CITATION_ELEMENTS)
      end
    end
  end
end
