# frozen_string_literal: true

require "shale"

module Sts
  module NisoSts
    class List < Shale::Mapper
      attribute :text, Shale::Type::String

      xml do
        root "list"
        map_content to: :text
      end
    end
  end
end
