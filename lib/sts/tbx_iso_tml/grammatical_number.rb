# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class GrammaticalNumber < Lutaml::Model::Serializable
      attribute :value, :string,
                values: %w[singular plural]

      xml do
        element "grammaticalNumber"
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "value", to: :value
      end
    end
  end
end
