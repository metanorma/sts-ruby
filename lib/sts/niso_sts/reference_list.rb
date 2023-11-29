# frozen_string_literal: true

require "shale"

require_relative "reference"

module Sts
  module NisoSts
    class ReferenceList < Shale::Mapper
      attribute :content_type, Shale::Type::String
      attribute :id, Shale::Type::String
      attribute :title, Shale::Type::String
      attribute :ref, Reference, collection: true

      xml do
        root "ref-list"
        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_element "title", to: :title
        map_element "ref", to: :ref
      end
    end
  end
end
