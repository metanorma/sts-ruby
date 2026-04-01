# frozen_string_literal: true

module Sts
  module NisoSts
    class NonNormativeNote < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :p, ::Sts::NisoSts::Paragraph
      attribute :label, ::Sts::NisoSts::Label

      xml do
        element "non-normative-note"
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id

        map_element "p", to: :p
        map_element "label", to: :label
      end
    end
  end
end
