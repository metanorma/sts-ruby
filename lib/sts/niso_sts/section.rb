# frozen_string_literal: true

require "shale"

require_relative "paragraph"
require_relative "list"
require_relative "term_section"

module Sts
  module NisoSts
    class Section < Shale::Mapper
      attribute :id, Shale::Type::String
      attribute :label, Shale::Type::String
      attribute :title, Shale::Type::String
      attribute :type, Shale::Type::String
      attribute :p, Paragraph, collection: true
      attribute :list, List, collection: true
      attribute :term_sec, TermSection, collection: true

      xml do
        root "standard"
        map_element "title", to: :title
        map_element "label", to: :label
        map_attribute "sec-type", to: :type
        map_attribute "id", to: :id
        map_element "p", to: :p
        map_element "term-sec", to: :term_sec
        map_element "list", to: :list
      end
    end
  end
end
