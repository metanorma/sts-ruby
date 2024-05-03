# frozen_string_literal: true

require_relative "../mapper"

require_relative "paragraph"

module Sts
  module NisoSts
    class Def < Sts::Mapper
      attribute :paragraph, Paragraph

      xml do
        root "def"

        map_element "p", to: :paragraph
      end
    end
  end
end
