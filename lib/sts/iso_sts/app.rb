# frozen_string_literal: true

module Sts
  module IsoSts
    class App < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :annex_type, ::Sts::IsoSts::AnnexType
      attribute :title, ::Sts::IsoSts::Title
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :sec, ::Sts::IsoSts::Sec, collection: true
      attribute :term_sec, ::Sts::IsoSts::TermSec, collection: true
      attribute :fn_group, ::Sts::IsoSts::FnGroup, collection: true
      attribute :ref_list, ::Sts::IsoSts::RefList, collection: true
      attribute :permissions, ::Sts::NisoSts::Permissions
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote

      xml do
        element "app"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "label", to: :label
        map_element "annex-type", to: :annex_type
        map_element "title", to: :title
        map_element "p", to: :paragraph
        map_element "sec", to: :sec
        map_element "term-sec", to: :term_sec
        map_element "fn-group", to: :fn_group
        map_element "ref-list", to: :ref_list
        map_element "permissions", to: :permissions
        map_element "non-normative-note", to: :non_normative_note
      end
    end
  end
end
