# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class NormativeAuthorization < Lutaml::Model::Serializable
      attribute :value, :string,
                values: %w[admittedTerm preferredTerm deprecatedTerm]

      xml do
        element "normativeAuthorization"
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "value", to: :value
      end
    end
  end
end
