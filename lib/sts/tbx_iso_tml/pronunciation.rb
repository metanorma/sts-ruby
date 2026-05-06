# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Pronunciation < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :value, :string

      xml do
        element "pronunciation"

        map_attribute "id", to: :id
        namespace ::Sts::Namespaces::TbxNamespace

        map_content to: :value
      end
    end
  end
end
