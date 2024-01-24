# frozen_string_literal: true

require "shale"

require_relative "italic"
require_relative "math"

module Sts
  module TbxIsoTml
    class Term < Shale::Mapper
      attribute :id, Shale::Type::String
      attribute :script, Shale::Type::String
      attribute :value, Shale::Type::String
      attribute :italic, Sts::TbxIsoTml::Italic
      attribute :sub, Shale::Type::String
      attribute :math, Sts::TbxIsoTml::Math

      xml do
        root "term"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "id", to: :id
        map_attribute "script", to: :script
        map_element "italic", to: :italic, namespace: nil, prefix: nil
        map_element "sub", to: :sub, namespace: nil, prefix: nil
        map_element "math", to: :math, namespace: "http://www.w3.org/1998/Math/MathML", prefix: "mml"
        map_content to: :value
      end
    end
  end
end
