# frozen_string_literal: true

module Sts
  module NisoSts
    class Def < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :paragraph, ::Sts::NisoSts::Paragraph

      xml do
        element "def"

        map_attribute "id", to: :id

        map_element "p", to: :paragraph
      end
    end
  end
end
