# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class TermType < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :value, :string,
                values: %w[acronym abbreviation equation formula fullForm symbol variant]

      xml do
        element "termType"
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "id", to: :id
        map_attribute "value", to: :value
      end
    end
  end
end
