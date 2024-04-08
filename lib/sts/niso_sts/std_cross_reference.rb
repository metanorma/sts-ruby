# frozen_string_literal: true

require "shale"

module Sts
  module NisoSts
    class StdCrossReference < Shale::Mapper
      attribute :type, Shale::Type::String
      attribute :std_ref, StandardRef, collection: true

      xml do
        root "iso-meta"
        map_attribute "type", to: :type
        map_element "std-ref", to: :std_ref
      end
    end
  end
end
