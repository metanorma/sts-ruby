# frozen_string_literal: true

require "shale"

require_relative "../mapper"

module Sts
  module NisoSts
    class Paragraph < Sts::Mapper; end

    class ListItem < Shale::Mapper
      attribute :label, Shale::Type::String
      attribute :p, Sts::NisoSts::Paragraph

      xml do
        root "list-item"

        map_element :label, to: :label
        map_element :p, to: :p
      end
    end
  end
end
