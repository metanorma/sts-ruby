# frozen_string_literal: true

require "lutaml/model"

require_relative "std_id"

module Sts
  module NisoSts
    class StdIdGroup < Lutaml::Model::Serializable
      attribute :std_id, StdId, collection: true

      xml do
        root "std-id-group"

        map_element "std-id", to: :std_id
      end
    end
  end
end
