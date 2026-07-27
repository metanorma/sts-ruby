# frozen_string_literal: true

module Sts
  module IsoSts
    class Aff < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :rid, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :addr_line, ::Sts::IsoSts::AddrLine, collection: true
      attribute :country, ::Sts::IsoSts::Country, collection: true
      attribute :fax, ::Sts::IsoSts::Fax, collection: true
      attribute :institution, ::Sts::IsoSts::Institution, collection: true
      attribute :phone, ::Sts::IsoSts::Phone, collection: true
      attribute :email, ::Sts::IsoSts::Email, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :inline_supplementary_material, ::Sts::IsoSts::InlineSupplementaryMaterial,
                collection: true
      attribute :related_article, ::Sts::IsoSts::RelatedArticle,
                collection: true
      attribute :related_object, ::Sts::IsoSts::RelatedObject, collection: true
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
      attribute :label, ::Sts::IsoSts::Label, collection: true
      attribute :fn, ::Sts::IsoSts::Fn, collection: true
      attribute :target, ::Sts::IsoSts::Target, collection: true
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :xref, ::Sts::IsoSts::Xref, collection: true
      attribute :sub, ::Sts::IsoSts::Sub, collection: true
      attribute :sup, ::Sts::IsoSts::Sup, collection: true

      xml do # rubocop:disable Metrics/BlockLength
        element "aff"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "rid", to: :rid
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
        map_element "addr-line", to: :addr_line
        map_element "country", to: :country
        map_element "fax", to: :fax
        map_element "institution", to: :institution
        map_element "phone", to: :phone
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "inline-supplementary-material",
                    to: :inline_supplementary_material
        map_element "related-article", to: :related_article
        map_element "related-object", to: :related_object
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
        map_element "label", to: :label
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
