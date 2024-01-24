# frozen_string_literal: true

require "shale"

module Sts
  module TbxIsoTml
    class Fn < Shale::Mapper
      attribute :id, Shale::Type::String
      attribute :p, Shale::Type::String

      xml do
        root "fn"

        map_attribute "id", to: :id
        map_element "p", to: :p
      end
    end
  end
end
