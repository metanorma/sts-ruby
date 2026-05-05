# frozen_string_literal: true

module Sts
  module IsoSts
    class NonNormativeExample < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :originator, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :preformat, ::Sts::IsoSts::Preformat, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true

      xml do
        element "non-normative-example"
        ordered

        map_attribute "id", to: :id
        map_attribute "originator", to: :originator

        map_element "label", to: :label
        map_element "p", to: :paragraph
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "preformat", to: :preformat
        map_element "styled-content", to: :styled_content
      end
    end
  end
end
