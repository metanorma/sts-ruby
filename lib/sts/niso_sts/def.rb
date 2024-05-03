# frozen_string_literal: true

require "shale"

require_relative "paragraph"

module Sts
  module NisoSts
    class Def < Shale::Mapper
      attribute :paragraph, Paragraph

      xml do
        root "def"

        map_element "p", to: :paragraph
      end
    end
  end
end
