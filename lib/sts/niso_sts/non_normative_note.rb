# frozen_string_literal: true

require "shale"

require_relative "paragraph"

module Sts
  module NisoSts
    class NonNormativeNote < Shale::Mapper
      attribute :p, Paragraph
      attribute :label, Shale::Type::String

      xml do
        root "non-normative-note"
        map_element "p", to: :p
        map_element "label", to: :label
      end
    end
  end
end
