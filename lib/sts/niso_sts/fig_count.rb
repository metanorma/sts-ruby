# frozen_string_literal: true

module Sts
  module NisoSts
    class FigCount < Lutaml::Model::Serializable
      attribute :count, :integer

      xml do
        element "fig-count"
        map_attribute "count", to: :count
      end
    end
  end
end
