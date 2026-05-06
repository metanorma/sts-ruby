# frozen_string_literal: true

module Sts
  module NisoSts
    class DispQuote < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :originator, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :attribution, ::Sts::NisoSts::Attribution
      attribute :paragraphs, ::Sts::NisoSts::Paragraph, collection: true

      xml do
        element "disp-quote"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "originator", to: :originator
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label
        map_element "attribution", to: :attribution
        map_element "p", to: :paragraphs
      end
    end
  end
end
