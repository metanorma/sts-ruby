# frozen_string_literal: true

require "lutaml/model"

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
    class Caption < Lutaml::Model::Serializable; end

    class Figure < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :orientation, :string
      attribute :caption, Caption
      attribute :def_list, DefList
      attribute :label, Label
      attribute :graphic, Graphic, collection: true

      xml do
        root "fig", mixed: true

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
