# frozen_string_literal: true

require "shale"

require_relative "list"

module Sts
  module NisoSts
    class Paragraph < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :text, Shale::Type::String
      attribute :bold, Shale::Type::String
      attribute :list, Sts::NisoSts::List

      xml do
        root "p"

        map_attribute 'id', to: :id
        map_content to: :text
        map_element "bold", to: :bold
        map_element "list", to: :list
      end
    end
  end
end
