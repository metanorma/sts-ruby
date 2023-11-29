# frozen_string_literal: true

require "shale"

require_relative "reference_standard"

module Sts
  module NisoSts
    class Reference < Shale::Mapper
      attribute :content_type, Shale::Type::String
      attribute :id, Shale::Type::String
      attribute :label, Shale::Type::String
      attribute :std, ReferenceStandard, collection: true

      xml do
        root "ref"
        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_element "label", to: :label
        map_element "std", to: :std
      end
    end
  end
end
