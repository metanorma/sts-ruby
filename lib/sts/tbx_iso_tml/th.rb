# frozen_string_literal: true

require_relative "../mapper"

require_relative "italic"

module Sts
  module TbxIsoTml
    class Th < Sts::Mapper
      attribute :content, Shale::Type::String
      attribute :colspan, Shale::Type::String
      attribute :align, Shale::Type::String
      attribute :rowspan, Shale::Type::String
      attribute :break, Shale::Type::String
      attribute :italic, Italic

      xml do
        root "th"

        map_content to: :content
        map_attribute "colspan", to: :colspan
        map_attribute "align", to: :align
        map_attribute "rowspan", to: :rowspan

        map_element "break", to: :break, render_nil: true
        map_element "italic", to: :italic
      end
    end
  end
end
