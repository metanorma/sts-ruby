# frozen_string_literal: true

module Sts
  module NisoSts
    class TableCount < Lutaml::Model::Serializable
      attribute :count, :integer

      xml do
        element "table-count"
        map_attribute "count", to: :count
      end
    end
  end
end
