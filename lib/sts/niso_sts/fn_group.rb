# frozen_string_literal: true

require_relative "../mapper"

require_relative "fn"

module Sts
  module NisoSts
    class FnGroup < Sts::Mapper
      attribute :fn, Fn, collection: true

      xml do
        root "fn-group"

        map_element "fn", to: :fn
      end
    end
  end
end
