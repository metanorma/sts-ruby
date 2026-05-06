# frozen_string_literal: true

module Sts
  module NisoSts
    class EditingInstruction < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :rid, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, :string
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true

      xml do
        element "editing-instruction"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "rid", to: :rid
        map_attribute "specific-use", to: :specific_use
        map_element "label", to: :label
        map_element "title", to: :title
        map_element "p", to: :p
      end
    end
  end
end
