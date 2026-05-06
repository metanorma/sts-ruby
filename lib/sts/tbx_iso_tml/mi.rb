# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Mi < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string

      xml do
        element "mi"

        map_attribute "id", to: :id
        namespace ::Sts::Namespaces::MathmlNamespace

        map_content to: :content
      end
    end
  end
end
