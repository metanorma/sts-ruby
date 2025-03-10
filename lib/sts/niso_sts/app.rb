# frozen_string_literal: true

require "lutaml/model"

require_relative "section"
require_relative "title"
require_relative "paragraph"
require_relative "non_normative_note"
require_relative "figure"
require_relative "reference_list"
require_relative "../tbx_iso_tml/table_wrap"

module Sts
  module NisoSts
    class Title < Lutaml::Model::Serializable; end
    class ReferenceList < Lutaml::Model::Serializable; end

    class App < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :label, Label
      attribute :annex_type, :string
      attribute :title, Title
      attribute :fig, Figure, collection: true
      attribute :sec, Section, collection: true
      attribute :paragraph, Paragraph, collection: true
      attribute :ref_list, ReferenceList, collection: true
      attribute :non_normative_note, NonNormativeNote, collection: true
      attribute :table_wrap, Sts::TbxIsoTml::TableWrap, collection: true

      xml do
        root "app", mixed: true

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type

        map_element "label", to: :label
        map_element "annex-type", to: :annex_type
        map_element "title", to: :title
        map_element "sec", to: :sec
        map_element "fig", to: :fig
        map_element "p", to: :paragraph
        map_element "ref-list", to: :ref_list
        map_element "non-normative-note", to: :non_normative_note
        map_element "table-wrap", to: :table_wrap
      end
    end
  end
end
