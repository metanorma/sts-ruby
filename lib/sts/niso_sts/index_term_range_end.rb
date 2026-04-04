# frozen_string_literal: true

module Sts
  module NisoSts
    class IndexTermRangeEnd < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :rid, :string

      xml do
        element "index-term-range-end"

        map_attribute "id", to: :id
        map_attribute "rid", to: :rid
      end
    end
  end
end
