# frozen_string_literal: true

require "shale"

require_relative "list"

module Sts
  module NisoSts
    class Paragraph < Sts::Mapper
      attribute :text, Shale::Type::String
      attribute :bold, Shale::Type::String
      attribute :list, Sts::NisoSts::List

      xml do
        root "p"

        map_content to: :text
        map_element "bold", to: :bold
        map_element "list", to: :list
      end
    end
  end
end
