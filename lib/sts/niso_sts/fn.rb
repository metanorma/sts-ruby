# frozen_string_literal: true


module Sts
  module NisoSts
    class Fn < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :paragraph, ::Sts::NisoSts::Paragraph

      xml do
        element "fn"

        map_attribute "id", to: :id

        map_element "label", to: :label
        map_element "p", to: :paragraph
      end
    end
  end
end
