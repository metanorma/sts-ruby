# frozen_string_literal: true

require "shale"

module Sts
  module TbxIsoTml
    class Caption < Shale::Mapper
      attribute :p, Shale::Type::String

      xml do
        root "caption"

        map_element "p", to: :p
      end
    end
  end
end
