# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class StandardRef < Lutaml::Model::Serializable
      attribute :type, Lutaml::Model::Type::String
      attribute :value, Lutaml::Model::Type::String

      xml do
        root "std-ref"
        map_attribute "type", to: :type
        map_content to: :value
      end
    end
  end
end
