# frozen_string_literal: true


module Sts
  module NisoSts
    class StdIdGroup < Lutaml::Model::Serializable
      attribute :std_id, ::Sts::NisoSts::StdId, collection: true

      xml do
        element "std-id-group"

        map_element "std-id", to: :std_id
      end
    end
  end
end
