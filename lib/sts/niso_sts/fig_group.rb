# frozen_string_literal: true

module Sts
  module NisoSts
    class FigGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :orientation, :string
      attribute :position, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :caption, ::Sts::NisoSts::Caption
      attribute :fig, ::Sts::NisoSts::Figure, collection: true

      xml do
        element "fig-group"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "orientation", to: :orientation
        map_attribute "position", to: :position
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "fig", to: :fig
      end
    end
  end
end
