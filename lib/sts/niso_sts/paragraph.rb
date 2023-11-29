# frozen_string_literal: true

require "shale"

module Sts
  module NisoSts
    class Paragraph < Shale::Mapper
      attribute :text, Shale::Type::String

      xml do
        root "p"
        map_content to: :text
      end
    end
  end
end
