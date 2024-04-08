# frozen_string_literal: true

require "shale"

require_relative "paragraph"

module Sts
  module NisoSts
    class MetaNote < Shale::Mapper
      attribute :id, Shale::Type::String
      attribute :content_type, Shale::Type::String
      attribute :p, Paragraph, collection: true
      attribute :title, Shale::Type::String

      xml do
        root "meta-note"
        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_element "p", to: :p
        map_element "title", to: :title
      end
    end
  end
end
