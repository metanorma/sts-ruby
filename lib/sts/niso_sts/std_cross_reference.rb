# frozen_string_literal: true

module Sts
  module NisoSts
    class StdCrossReference < Lutaml::Model::Serializable
      attribute :type, :string
      attribute :std_ref, ::Sts::NisoSts::StandardRef, collection: true

      xml do
        element "std-xref"

        map_attribute "type", to: :type
        map_element "std-ref", to: :std_ref
      end
    end
  end
end
