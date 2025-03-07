# frozen_string_literal: true

require "lutaml/model"

require_relative "../tbx_iso_tml"
require_relative "term_display"
require_relative "../tbx_iso_tml/term_entry"

module Sts
  module NisoSts
    class TermSection < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :sec_type, :string
      attribute :label, Label
      attribute :term_entry, Sts::TbxIsoTml::TermEntry # , collection: true
      attribute :term_display, TermDisplay # , collection: true

      xml do
        root "term-sec", mixed: true
        map_attribute "id", to: :id
        map_attribute "sec-type", to: :sec_type

        map_element "label", to: :label
        map_element "term-display", to: :term_display
        map_element "termEntry", to: :term_entry,
                                 namespace: "urn:iso:std:iso:30042:ed-1",
                                 prefix: "tbx"
      end
    end
  end
end
