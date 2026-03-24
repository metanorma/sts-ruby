# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class GrammaticalGender < Lutaml::Model::Serializable
      attribute :value, :string,
                values: %w[masculine feminine neuter]

      xml do
        element "grammaticalGender"
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "value", to: :value
      end
    end
  end
end
