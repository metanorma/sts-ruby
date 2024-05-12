# frozen_string_literal: true

require_relative "front"

module Sts
  module NisoSts
    class AdoptionFront < Front
      xml do
        root "adoption-front"
        map_element "iso-meta", to: :iso_meta
        map_element "std-meta", to: :std_meta
        map_element "sec", to: :sec
      end
    end
  end
end
