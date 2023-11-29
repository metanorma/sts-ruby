# frozen_string_literal: true

require "shale"

require_relative "paragraph"
require_relative "non_normative_note"

module Sts
  module NisoSts
    class TermDisplay < Shale::Mapper
      attribute :p, Paragraph, collection: true
      attribute :non_normative_note, NonNormativeNote, collection: true

      xml do
        root "term-display"

        map_element "p", to: :p
        map_element "non-normative-note", to: :non_normative_note
      end
    end
  end
end
