# frozen_string_literal: true

require_relative "../mapper"

require_relative "semantics"
require_relative "mrow"
require_relative "munder"

module Sts
  module TbxIsoTml
    class Semantics < Sts::Mapper
      attribute :mrow, Mrow, collection: true
      attribute :mo, Shale::Type::String
      attribute :mtext, Shale::Type::String
      attribute :munder, Sts::TbxIsoTml::Munder

      xml do
        root "math"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_element "mrow", to: :mrow
        map_element "mo", to: :mo
        map_element "munder", to: :munder
        map_element "mtext", to: :mtext

        map_content to: :content
      end
    end
  end
end
