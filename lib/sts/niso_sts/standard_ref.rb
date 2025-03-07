# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class StandardRef < Lutaml::Model::Serializable
      attribute :type, :string
      attribute :value, :string

      xml do
        root "std-ref"
        map_attribute "type", to: :type
        map_content to: :value
      end
    end
  end
end
