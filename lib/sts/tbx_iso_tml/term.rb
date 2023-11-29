# frozen_string_literal: true

require "shale"

module Sts
  module TbxIsoTml
    class Term < Shale::Mapper
      attribute :id, Shale::Type::String
      attribute :value, Shale::Type::String

      xml do
        root "term"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "id", to: :id
        map_content to: :value
      end
    end
  end
end
