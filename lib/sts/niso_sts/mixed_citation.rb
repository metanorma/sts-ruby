# frozen_striing_literal: true

require_relative "../mapper"

require_relative "ext_link"
require_relative "reference_standard"

module Sts
  module NisoSts
    class MixedCitation < Sts::Mapper
      attribute :content, Shale::Type::String
      attribute :bold, Shale::Type::String
      attribute :italic, Shale::Type::String
      attribute :publication_type, Shale::Type::String
      attribute :std, ReferenceStandard
      attribute :ext_link, ExtLink

      xml do
        root "mixed-citation"

        map_content to: :content

        map_attribute "publication-type", to: :publication_type

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "std", to: :std
        map_element "ext-link", to: :ext_link
      end
    end
  end
end
