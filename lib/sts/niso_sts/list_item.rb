# frozen_string_literal: true

require_relative "../mapper"
require_relative "list"

module Sts
  module NisoSts
    class Paragraph < Sts::Mapper; end
    class List < Sts::Mapper; end

    class ListItem < Sts::Mapper
      attribute :label, Shale::Type::String
      attribute :p, Sts::NisoSts::Paragraph
      attribute :list, List

      xml do
        root "list-item"

        map_element :label, to: :label
        map_element :p, to: :p
        map_element :list, to: :list
      end
    end
  end
end
