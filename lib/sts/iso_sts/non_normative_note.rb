# frozen_string_literal: true

module Sts
  module IsoSts
    class NonNormativeNote < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :originator, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true

      xml do
        element "non-normative-note"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "originator", to: :originator

        map_element "label", to: :label
        map_element "p", to: :paragraph
        map_element "list", to: :list
        map_element "def-list", to: :def_list
      end
    end
  end
end
