# frozen_string_literal: true

require_relative "../mapper"
require_relative "mstyle"

module Sts
  module TbxIsoTml
    class Mi < Sts::Mapper
      attribute :content, Shale::Type::String

      xml do
        root "mi"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_content to: :content
      end
    end
  end
end
