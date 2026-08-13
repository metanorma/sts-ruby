# frozen_string_literal: true

module Sts
  module IsoSts
    class Collab < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :collab_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xlink_type, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :content, :string, collection: true
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
      attribute :abbrev, ::Sts::IsoSts::Abbrev, collection: true
      attribute :milestone_end, ::Sts::IsoSts::MilestoneEnd, collection: true
      attribute :milestone_start, ::Sts::IsoSts::MilestoneStart,
                collection: true
      attribute :named_content, ::Sts::IsoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :sub, ::Sts::IsoSts::Sub, collection: true
      attribute :sup, ::Sts::IsoSts::Sup, collection: true
      attribute :addr_line, ::Sts::IsoSts::AddrLine, collection: true
      attribute :country, ::Sts::IsoSts::Country, collection: true
      attribute :fax, ::Sts::IsoSts::Fax, collection: true
      attribute :institution, ::Sts::IsoSts::Institution, collection: true
      attribute :phone, ::Sts::IsoSts::Phone, collection: true
      attribute :contrib_group, ::Sts::IsoSts::ContribGroup, collection: true
      attribute :address, ::Sts::IsoSts::Address, collection: true
      attribute :aff, ::Sts::IsoSts::Aff, collection: true
      attribute :aff_alternatives, ::Sts::IsoSts::AffAlternatives,
                collection: true
      attribute :author_comment, ::Sts::IsoSts::AuthorComment, collection: true
      attribute :bio, ::Sts::IsoSts::Bio, collection: true
      attribute :email, ::Sts::IsoSts::Email, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :on_behalf_of, ::Sts::IsoSts::OnBehalfOf, collection: true
      attribute :role, ::Sts::IsoSts::Role, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :xref, ::Sts::IsoSts::Xref, collection: true
      attribute :fn, ::Sts::IsoSts::Fn, collection: true

      xml do # rubocop:disable Metrics/BlockLength
        element "collab"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "collab-type", to: :collab_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_content to: :content
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
        map_element "abbrev", to: :abbrev
        map_element "milestone-end", to: :milestone_end
        map_element "milestone-start", to: :milestone_start
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "addr-line", to: :addr_line
        map_element "country", to: :country
        map_element "fax", to: :fax
        map_element "institution", to: :institution
        map_element "phone", to: :phone
        map_element "contrib-group", to: :contrib_group
        map_element "address", to: :address
        map_element "aff", to: :aff
        map_element "aff-alternatives", to: :aff_alternatives
        map_element "author-comment", to: :author_comment
        map_element "bio", to: :bio
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "on-behalf-of", to: :on_behalf_of
        map_element "role", to: :role
        map_element "uri", to: :uri
        map_element "xref", to: :xref
        map_element "fn", to: :fn
      end
    end
  end
end
