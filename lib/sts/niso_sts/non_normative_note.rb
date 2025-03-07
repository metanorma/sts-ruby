# frozen_string_literal: true

require "lutaml/model"

require_relative "paragraph"

module Sts
  module NisoSts
    class NonNormativeNote < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :p, Paragraph
      attribute :label, Label

      xml do
        root "non-normative-note", mixed: true

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id

        map_element "p", to: :p
        map_element "label", to: :label
      end
    end
  end
end
