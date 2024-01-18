# frozen_string_literal: true

require "shale"

require_relative "tr"

module Sts
  module TbxIsoTml
    class Thead < Shale::Mapper
      attribute :tr, Sts::TbxIsoTml::Tr, collection: true

      xml do
        root "tbody"

        map_element "tr", to: :tr
      end
    end
  end
end
