# frozen_string_literal: true

require_relative "../mapper"

require_relative "paragraph"

module Sts
  module NisoSts
    class NonNormativeNote < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :content_type, Shale::Type::String
      attribute :p, Paragraph
      attribute :label, Label

      xml do
        root "non-normative-note"

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id

        map_element "p", to: :p
        map_element "label", to: :label
      end
    end
  end
end
