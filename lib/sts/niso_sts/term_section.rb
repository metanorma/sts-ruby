# frozen_string_literal: true

require_relative "../mapper"

require_relative "../tbx_iso_tml"
require_relative "term_display"
require_relative "../tbx_iso_tml/term_entry"

module Sts
  module NisoSts
    class TermSection < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :sec_type, Shale::Type::String
      attribute :label, Label
      attribute :term_entry, Sts::TbxIsoTml::TermEntry # , collection: true
      attribute :term_display, TermDisplay # , collection: true

      xml do
        root "term-sec"
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
