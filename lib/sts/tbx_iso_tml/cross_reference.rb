# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class CrossReference < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :value, :string, collection: true
      xml do
        element "crossReference"
        map_attribute "id", to: :id
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_content to: :value
      end
    end
  end
end
