# frozen_string_literal: true

require "shale"

require_relative "paragraph"

module Sts
  module NisoSts
    class Fn < Shale::Mapper
      attribute :id, Shale::Type::String
      attribute :label, Shale::Type::String
      attribute :paragraph, Paragraph

      xml do
        root "fn"

        map_attribute "id", to: :id

        map_element "label", to: :label
        map_element "p", to: :paragraph
      end
    end
  end
end
