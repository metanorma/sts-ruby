# frozen_string_literal: true

require "shale"

module Sts
  module NisoSts
    class ReferenceStandard < Shale::Mapper
      attribute :type, Shale::Type::String
      attribute :std_id, Shale::Type::String
      attribute :content, Shale::Type::String
      # attribute :std_ref, Shale::Type::String
      # attribute :title, Shale::Type::String

      xml do
        root "std"
        map_attribute "type", to: :type
        map_attribute "std-id", to: :std_id
        map_content to: :content
        # map_element "std-ref", to: :std_ref
        # map_element "title", to: :title
      end
    end
  end
end
