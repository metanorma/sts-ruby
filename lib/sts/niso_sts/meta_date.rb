# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module NisoSts
    class MetaDate < Sts::Mapper
      attribute :content, Shale::Type::String
      attribute :type, Shale::Type::String

      xml do
        root "meta-date"

        map_content to: :content

        map_attribute :type, to: :type
      end
    end
  end
end
