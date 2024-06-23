# frozen_string_literal: true

require_relative "../mapper"

require_relative "paragraph"

module Sts
  module NisoSts
    class Paragraph < Sts::Mapper; end

    class NonNormativeExample < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :p, Paragraph
      attribute :label, Label

      xml do
        root "non-normative-example"

        map_attribute "id", to: :id
        map_element "p", to: :p
        map_element "label", to: :label
      end
    end
  end
end
