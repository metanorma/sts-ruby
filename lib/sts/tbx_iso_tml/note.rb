# frozen_string_literal: true

require "shale"

module Sts
  module TbxIsoTml
    class Note < Shale::Mapper
      attribute :value, Shale::Type::String

      xml do
        root "note"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_content to: :value
      end
    end
  end
end
