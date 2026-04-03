# frozen_string_literal: true

module Sts
  module NisoSts
    class CommRefGroup < Lutaml::Model::Serializable
      attribute :comm_ref, :string, collection: true

      xml do
        element "comm-ref-group"

        map_element "comm-ref", to: :comm_ref
      end
    end
  end
end
