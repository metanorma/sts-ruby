# frozen_string_literal: true

require "shale"

require_relative "std_id"

module Sts
  module NisoSts
    class StdIdGroup < Shale::Mapper
      attribute :std_id, StdId, collection: true

      xml do
        root "std-id-group"

        map_element "std-id", to: :std_id
      end
    end
  end
end
