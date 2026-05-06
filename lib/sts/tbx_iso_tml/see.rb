# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class See < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :script, :string
      attribute :value, :string

      xml do
        element "see"
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "id", to: :id
        map_attribute "script", to: :script
        map_content to: :value
      end
    end
  end
end
