# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class Italic < Sts::Mapper
      attribute :value, Shale::Type::String
      attribute :sub, Shale::Type::String

      xml do
        root "italic"
        namespace nil, nil

        map_content to: :value
        map_element "sub", to: :sub
      end
    end
  end
end
