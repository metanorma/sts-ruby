# frozen_string_literal: true

require "shale"

module Sts
  module NisoSts
    class PageCount < Shale::Mapper
      attribute :count, Shale::Type::Integer

      xml do
        root "page-count"
        map_attribute "count", to: :count
      end
    end
  end
end
