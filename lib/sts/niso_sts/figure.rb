# frozen_string_literal: true

require_relative "../mapper"

require_relative "caption"
require_relative "graphic"
require_relative "def_list"

# <fig id="fig-1" orientation="portrait">
#   <label>Figure 1</label>
#   <caption...>
#   <graphic...>
# </fig>

module Sts
  module NisoSts
    class Caption < Sts::Mapper; end

    class Figure < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :orientation, Shale::Type::String
      attribute :caption, Caption
      attribute :def_list, DefList
      attribute :label, Shale::Type::String
      attribute :graphic, Graphic, collection: true

      xml do
        root "fig"

        map_attribute "id", to: :id
        map_attribute "orientation", to: :orientation

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "graphic", to: :graphic
        map_element "def-list", to: :def_list
      end
    end
  end
end
