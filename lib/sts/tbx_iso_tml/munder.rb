# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Munder < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :mrow, ::Sts::TbxIsoTml::Mrow, collection: true

      xml do
        element "munder"

        map_attribute "id", to: :id
        namespace ::Sts::Namespaces::MathmlNamespace

        map_element "mrow", to: :mrow
      end
    end
  end
end
