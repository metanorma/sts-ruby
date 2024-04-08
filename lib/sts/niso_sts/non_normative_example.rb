# frozen_string_literal: true

require "shale"

require_relative "paragraph"

module Sts
  module NisoSts
    class NonNormativeExample < Shale::Mapper
      attribute :id, Shale::Type::String
      attribute :p, Paragraph
      attribute :label, Shale::Type::String

      xml do
        root "non-normative-example"
        map_attribute "id", to: :id
        map_element "p", to: :p
        map_element "label", to: :label
      end
    end
  end
end
