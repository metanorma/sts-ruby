# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module NisoSts
    class StandardRef < Sts::Mapper
      attribute :type, Shale::Type::String
      attribute :value, Shale::Type::String

      xml do
        root "std-ref"
        map_attribute "type", to: :type
        map_content to: :value
      end
    end
  end
end
