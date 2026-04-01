# frozen_string_literal: true

module Sts
  module NisoSts
    class Def < Lutaml::Model::Serializable
      attribute :paragraph, ::Sts::NisoSts::Paragraph

      xml do
        element "def"

        map_element "p", to: :paragraph
      end
    end
  end
end
