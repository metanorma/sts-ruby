# frozen_string_literal: true

module Sts
  module NisoSts
    class RefCount < Lutaml::Model::Serializable
      attribute :count, :integer

      xml do
        element "ref-count"
        map_attribute "count", to: :count
      end
    end
  end
end
