# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class StdCrossReference < Lutaml::Model::Serializable
      attribute :type, Lutaml::Model::Type::String
      attribute :std_ref, StandardRef, collection: true

      xml do
        root "std-xref"

        map_attribute "type", to: :type
        map_element "std-ref", to: :std_ref
      end
    end
  end
end
