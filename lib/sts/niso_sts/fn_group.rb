# frozen_string_literal: true

require "shale"

require_relative "fn"

module Sts
  module NisoSts
    class FnGroup < Shale::Mapper
      attribute :fn, Fn, collection: true

      xml do
        root "fn-group"

        map_element "fn", to: :fn
      end
    end
  end
end
