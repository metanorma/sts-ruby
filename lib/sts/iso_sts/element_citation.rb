# frozen_string_literal: true

module Sts
  module IsoSts
    class ElementCitation < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :publication_type, :string
      attribute :publisher_type, :string
      attribute :publication_format, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xlink_type, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :break, ::Sts::IsoSts::Break, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :monospace, ::Sts::IsoSts::Monospace, collection: true
      attribute :num, ::Sts::IsoSts::Num, collection: true
      attribute :overline, ::Sts::IsoSts::Overline, collection: true
      attribute :roman, ::Sts::IsoSts::Roman, collection: true
      attribute :sans_serif, ::Sts::IsoSts::SansSerif, collection: true
      attribute :sc, ::Sts::IsoSts::Sc, collection: true
      attribute :strike, ::Sts::IsoSts::Strike, collection: true
      attribute :underline, ::Sts::IsoSts::Underline, collection: true
      attribute :alternatives, ::Sts::IsoSts::Alternatives, collection: true
      attribute :inline_graphic, ::Sts::IsoSts::InlineGraphic, collection: true
      attribute :private_char, ::Sts::IsoSts::PrivateChar, collection: true
      attribute :chem_struct, ::Sts::IsoSts::ChemStruct, collection: true
      attribute :inline_formula, ::Sts::IsoSts::InlineFormula, collection: true
      attribute :label, ::Sts::IsoSts::Label, collection: true
      attribute :abbrev, ::Sts::IsoSts::Abbrev, collection: true
      attribute :milestone_end, ::Sts::IsoSts::MilestoneEnd, collection: true
      attribute :milestone_start, ::Sts::IsoSts::MilestoneStart,
                collection: true
      attribute :named_content, ::Sts::IsoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :annotation, ::Sts::IsoSts::Annotation, collection: true
      attribute :article_title, ::Sts::IsoSts::ArticleTitle, collection: true
      attribute :chapter_title, ::Sts::IsoSts::ChapterTitle, collection: true
      attribute :collab, ::Sts::IsoSts::Collab, collection: true
      attribute :comment, ::Sts::IsoSts::Comment, collection: true
      attribute :conf_date, ::Sts::IsoSts::ConfDate, collection: true
      attribute :conf_loc, ::Sts::IsoSts::ConfLoc, collection: true
      attribute :conf_name, ::Sts::IsoSts::ConfName, collection: true
      attribute :conf_sponsor, ::Sts::IsoSts::ConfSponsor, collection: true
      attribute :date, ::Sts::IsoSts::Date, collection: true
      attribute :date_in_citation, ::Sts::IsoSts::DateInCitation,
                collection: true
      attribute :day, ::Sts::IsoSts::Day, collection: true
      attribute :edition, ::Sts::IsoSts::Edition, collection: true
      attribute :email, ::Sts::IsoSts::Email, collection: true
      attribute :elocation_id, ::Sts::IsoSts::ElocationId, collection: true
      attribute :etal, ::Sts::IsoSts::Etal, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :fpage, ::Sts::IsoSts::Fpage, collection: true
      attribute :gov, ::Sts::IsoSts::Gov, collection: true
      attribute :institution, ::Sts::IsoSts::Institution, collection: true
      attribute :isbn, ::Sts::IsoSts::Isbn, collection: true
      attribute :issn, ::Sts::IsoSts::Issn, collection: true
      attribute :issue, ::Sts::IsoSts::Issue, collection: true
      attribute :issue_id, ::Sts::IsoSts::IssueId, collection: true
      attribute :issue_part, ::Sts::IsoSts::IssuePart, collection: true
      attribute :issue_title, ::Sts::IsoSts::IssueTitle, collection: true
      attribute :lpage, ::Sts::IsoSts::Lpage, collection: true
      attribute :month, ::Sts::IsoSts::Month, collection: true
      attribute :name, ::Sts::IsoSts::Name, collection: true
      attribute :name_alternatives, ::Sts::IsoSts::NameAlternatives,
                collection: true
      attribute :sts_object_id, ::Sts::IsoSts::ObjectId, collection: true
      attribute :page_range, ::Sts::IsoSts::PageRange, collection: true
      attribute :part_title, ::Sts::IsoSts::PartTitle, collection: true
      attribute :patent, ::Sts::IsoSts::Patent, collection: true
      attribute :person_group, ::Sts::IsoSts::PersonGroup, collection: true
      attribute :pub_id, ::Sts::IsoSts::PubId, collection: true
      attribute :publisher_loc, ::Sts::IsoSts::PublisherLoc, collection: true
      attribute :publisher_name, ::Sts::IsoSts::PublisherName, collection: true
      attribute :role, ::Sts::IsoSts::Role, collection: true
      attribute :season, ::Sts::IsoSts::Season, collection: true
      attribute :series, ::Sts::IsoSts::Series, collection: true
      attribute :size, ::Sts::IsoSts::Size, collection: true
      attribute :source, ::Sts::IsoSts::Source, collection: true
      attribute :std, ::Sts::IsoSts::Std, collection: true
      attribute :string_name, ::Sts::IsoSts::StringName, collection: true
      attribute :supplement, ::Sts::IsoSts::Supplement, collection: true
      attribute :trans_source, ::Sts::IsoSts::TransSource, collection: true
      attribute :trans_title, ::Sts::IsoSts::TransTitle, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :volume, ::Sts::IsoSts::Volume, collection: true
      attribute :volume_id, ::Sts::IsoSts::VolumeId, collection: true
      attribute :volume_series, ::Sts::IsoSts::VolumeSeries, collection: true
      attribute :year, ::Sts::IsoSts::Year, collection: true
      attribute :fn, ::Sts::IsoSts::Fn, collection: true
      attribute :target, ::Sts::IsoSts::Target, collection: true
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :xref, ::Sts::IsoSts::Xref, collection: true
      attribute :sub, ::Sts::IsoSts::Sub, collection: true
      attribute :sup, ::Sts::IsoSts::Sup, collection: true

      xml do # rubocop:disable Metrics/BlockLength
        element "element-citation"
        ordered

        map_attribute "id", to: :id
        map_attribute "publication-type", to: :publication_type
        map_attribute "publisher-type", to: :publisher_type
        map_attribute "publication-format", to: :publication_format
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_element "break", to: :break
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "monospace", to: :monospace
        map_element "num", to: :num
        map_element "overline", to: :overline
        map_element "roman", to: :roman
        map_element "sans-serif", to: :sans_serif
        map_element "sc", to: :sc
        map_element "strike", to: :strike
        map_element "underline", to: :underline
        map_element "alternatives", to: :alternatives
        map_element "inline-graphic", to: :inline_graphic
        map_element "private-char", to: :private_char
        map_element "chem-struct", to: :chem_struct
        map_element "inline-formula", to: :inline_formula
        map_element "label", to: :label
        map_element "abbrev", to: :abbrev
        map_element "milestone-end", to: :milestone_end
        map_element "milestone-start", to: :milestone_start
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "annotation", to: :annotation
        map_element "article-title", to: :article_title
        map_element "chapter-title", to: :chapter_title
        map_element "collab", to: :collab
        map_element "comment", to: :comment
        map_element "conf-date", to: :conf_date
        map_element "conf-loc", to: :conf_loc
        map_element "conf-name", to: :conf_name
        map_element "conf-sponsor", to: :conf_sponsor
        map_element "date", to: :date
        map_element "date-in-citation", to: :date_in_citation
        map_element "day", to: :day
        map_element "edition", to: :edition
        map_element "email", to: :email
        map_element "elocation-id", to: :elocation_id
        map_element "etal", to: :etal
        map_element "ext-link", to: :ext_link
        map_element "fpage", to: :fpage
        map_element "gov", to: :gov
        map_element "institution", to: :institution
        map_element "isbn", to: :isbn
        map_element "issn", to: :issn
        map_element "issue", to: :issue
        map_element "issue-id", to: :issue_id
        map_element "issue-part", to: :issue_part
        map_element "issue-title", to: :issue_title
        map_element "lpage", to: :lpage
        map_element "month", to: :month
        map_element "name", to: :name
        map_element "name-alternatives", to: :name_alternatives
        map_element "object-id", to: :sts_object_id
        map_element "page-range", to: :page_range
        map_element "part-title", to: :part_title
        map_element "patent", to: :patent
        map_element "person-group", to: :person_group
        map_element "pub-id", to: :pub_id
        map_element "publisher-loc", to: :publisher_loc
        map_element "publisher-name", to: :publisher_name
        map_element "role", to: :role
        map_element "season", to: :season
        map_element "series", to: :series
        map_element "size", to: :size
        map_element "source", to: :source
        map_element "std", to: :std
        map_element "string-name", to: :string_name
        map_element "supplement", to: :supplement
        map_element "trans-source", to: :trans_source
        map_element "trans-title", to: :trans_title
        map_element "uri", to: :uri
        map_element "volume", to: :volume
        map_element "volume-id", to: :volume_id
        map_element "volume-series", to: :volume_series
        map_element "year", to: :year
        map_element "fn", to: :fn
        map_element "target", to: :target
        map_element "entailedTerm", to: :entailed_term
        map_element "xref", to: :xref
        map_element "sub", to: :sub
        map_element "sup", to: :sup
      end
    end
  end
end
