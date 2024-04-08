# frozen_string_literal: true

require "shale"

require_relative "caption"
require_relative "graphic"

# <fig id="fig-1" orientation="portrait">
#   <label>Figure 1</label>
#   <caption...>
#   <graphic...>
# </fig>

module Sts
  module NisoSts
    class Figure < Shale::Mapper
      attribute :id, Shale::Type::String
      attribute :orientation, Shale::Type::String
      attribute :caption, Caption
      attribute :label, Shale::Type::String
      attribute :graphic, Graphic, collection: true

      xml do
        root "fig"

        map_attribute "id", to: :id
        map_attribute "orientation", to: :orientation

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "graphic", to: :graphic
      end
    end
  end
end

