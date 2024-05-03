# frozen_string_literal: true

require_relative "../mapper"

require_relative "section"

module Sts
  module NisoSts
    class Body < Sts::Mapper
      attribute :sec, Section, collection: true

      xml do
        root "body"
        map_element "sec", to: :sec
      end
    end
  end
end
