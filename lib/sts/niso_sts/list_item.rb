# frozen_string_literal: true

require_relative "../mapper"
require_relative "list"
require_relative "non_normative_example"

module Sts
  module NisoSts
    class Paragraph < Sts::Mapper; end
    class List < Sts::Mapper; end

    class ListItem < Sts::Mapper
      attribute :label, Label
      attribute :list, List
      attribute :non_normative_example, NonNormativeExample
      attribute :p, Sts::NisoSts::Paragraph

      xml do
        root "list-item"

        map_element :label, to: :label
        map_element :list, to: :list
        map_element "non-normative-example", to: :non_normative_example
        map_element :p, to: :p
      end
    end
  end
end
