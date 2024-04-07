# frozen_string_literal: true

require "shale"

require_relative "semantics"
require_relative "mrow"

module Sts
  module TbxIsoTml
    class Math < Shale::Mapper
      attribute :content, Shale::Type::String
      attribute :display, Shale::Type::String
      attribute :mrow, Mrow
      attribute :mo, Shale::Type::String
      attribute :semantics, Semantics

      xml do
        root "math"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_element "mrow", to: :mrow # , render_nil: true
        map_element "semantics", to: :semantics
        map_element "mo", to: :mo # , render_nil: true

        map_content to: :content
        map_attribute "display", to: :display
      end
    end
  end
end
