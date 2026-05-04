# frozen_string_literal: true

module Sts
  module NisoSts
    class BoxedText < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :orientation, :string
      attribute :position, :string
      attribute :specific_use, :string
      attribute :caption, ::Sts::NisoSts::Caption
      attribute :label, ::Sts::NisoSts::Label
      attribute :paragraphs, ::Sts::NisoSts::Paragraph, collection: true
      attribute :preformat, ::Sts::NisoSts::Preformat, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true

      xml do
        element "boxed-text"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "orientation", to: :orientation
        map_attribute "position", to: :position
        map_attribute "specific-use", to: :specific_use

        map_element "caption", to: :caption
        map_element "label", to: :label
        map_element "p", to: :paragraphs
        map_element "preformat", to: :preformat
        map_element "list", to: :list
      end
    end
  end
end
