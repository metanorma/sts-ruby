# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module NisoSts
    class StdId < Sts::Mapper
      attribute :std_id_link_type, Shale::Type::String
      attribute :std_id_type, Shale::Type::String
      attribute :specific_use, Shale::Type::String
      attribute :content, Shale::Type::String

      xml do
        root "std-id"

        map_attribute "std-id-link-type", to: :std_id_link_type
        map_attribute "std-id-type", to: :std_id_type
        map_attribute "specific-use", to: :specific_use

        map_content to: :content
      end
    end
  end
end
