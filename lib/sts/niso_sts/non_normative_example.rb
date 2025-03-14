# frozen_string_literal: true

require "lutaml/model"

require_relative "paragraph"

module Sts
  module NisoSts
    class Paragraph < Lutaml::Model::Serializable; end

    class NonNormativeExample < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :p, Paragraph
      attribute :label, Label

      xml do
        root "non-normative-example", mixed: true

        map_attribute "id", to: :id
        map_element "p", to: :p
        map_element "label", to: :label
      end
    end
  end
end
