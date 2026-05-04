# frozen_string_literal: true

module Sts
  module NisoSts
    class Statement < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :statement_type, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, ::Sts::NisoSts::Title
      attribute :paragraphs, ::Sts::NisoSts::Paragraph, collection: true

      xml do
        element "statement"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "statement-type", to: :statement_type

        map_element "label", to: :label
        map_element "title", to: :title
        map_element "p", to: :paragraphs
      end
    end
  end
end
