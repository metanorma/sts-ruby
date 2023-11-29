# frozen_string_literal: true

require "shale"

require_relative "reference_list"

module Sts
  module NisoSts
    class Back < Shale::Mapper
      attribute :ref_list, ReferenceList

      xml do
        root "back"
        map_element "ref-list", to: :ref_list
      end
    end
  end
end
