# frozen_striing_literal: true

require_relative "../mapper"

require_relative "ext_link"
require_relative "reference_standard"

module Sts
  module NisoSts
    class MixedCitation < Sts::Mapper
      attribute :content, Shale::Type::String
      attribute :bold, Shale::Type::String
      attribute :std, ReferenceStandard
      attribute :ext_link, ExtLink

      xml do
        root "mixed-citation"

        map_content to: :content

        map_element "bold", to: :bold
        map_element "std", to: :std
        map_element "ext-link", to: :ext_link
      end
    end
  end
end
