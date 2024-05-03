# frozen_string_literal: true

require "shale"

require_relative "reference_standard"
require_relative "mixed_citation"

module Sts
  module NisoSts
    class Reference < Sts::Mapper
      attribute :content_type, Shale::Type::String
      attribute :id, Shale::Type::String
      attribute :label, Shale::Type::String
      attribute :mixed_citation, MixedCitation
      attribute :std, ReferenceStandard, collection: true

      xml do
        root "ref"
        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_element "label", to: :label
        map_element "std", to: :std
        map_element "mixed-citation", to: :mixed_citation
      end
    end
  end
end
