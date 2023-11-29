# frozen_string_literal: true

require "shale"

require_relative "../tbx_iso_tml"
require_relative "term_display"

module Sts
  module NisoSts
    class TermSection < Shale::Mapper
      attribute :term_entry, TbxIsoTml::TermEntry # , collection: true
      attribute :term_display, TermDisplay # , collection: true

      xml do
        root "term-sec"

        map_element "term-display", to: :term_display
        map_element "termEntry", to: :term_entry,
                                 namespace: "urn:iso:std:iso:30042:ed-1",
                                 prefix: "tbx"
      end
    end
  end
end
