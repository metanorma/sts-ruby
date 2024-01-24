# frozen_string_literal: true

require "shale"

module Sts
  module TbxIsoTml
    class Col < Shale::Mapper
      attribute :width, Sts::TbxIsoTml::Col

      xml do
        root "col"

        map_attribute "width", to: :width
      end
    end
  end
end
