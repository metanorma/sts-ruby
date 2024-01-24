# frozen_string_literal: true

require "shale"

require_relative "italic"

module Sts
  module TbxIsoTml
    class Td < Shale::Mapper
      attribute :content, Shale::Type::String
      attribute :align, Shale::Type::String
      attribute :italic, Italic

      xml do
        root "tr"

        map_content to: :content
        map_attribute "align", to: :align

        map_element "italic", to: :italic
      end
    end
  end
end
