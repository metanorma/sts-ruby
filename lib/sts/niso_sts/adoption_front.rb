# frozen_string_literal: true


module Sts
  module NisoSts
    class AdoptionFront < Front
      xml do
        element "adoption-front"
        map_element "iso-meta", to: :iso_meta
        map_element "std-meta", to: :std_meta
        map_element "sec", to: :sec
      end
    end
  end
end
