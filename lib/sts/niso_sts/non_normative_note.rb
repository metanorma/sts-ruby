# frozen_string_literal: true

require_relative "../mapper"

require_relative "paragraph"

module Sts
  module NisoSts
    class NonNormativeNote < Sts::Mapper
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
