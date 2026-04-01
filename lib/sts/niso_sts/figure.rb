# frozen_string_literal: true

# <fig id="fig-1" orientation="portrait">
#   <label>Figure 1</label>
#   <caption...>
#   <graphic...>
# </fig>

module Sts
  module NisoSts
    class Figure < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :orientation, :string
      attribute :caption, ::Sts::NisoSts::Caption
      attribute :def_list, ::Sts::NisoSts::DefList
      attribute :label, ::Sts::NisoSts::Label
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true

      xml do
        element "fig"
        mixed_content

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
