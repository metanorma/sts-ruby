# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module NisoSts
    class StdCrossReference < Sts::Mapper
      attribute :type, Shale::Type::String
      attribute :std_ref, StandardRef, collection: true

      xml do
        root "std-xref"

        map_attribute "type", to: :type
        map_element "std-ref", to: :std_ref
      end
    end
  end
end
