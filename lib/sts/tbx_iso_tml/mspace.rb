# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Mspace < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :width, :string

      xml do
        element "mspace"
        namespace ::Sts::Namespaces::MathmlNamespace

        map_attribute "id", to: :id
        map_attribute "width", to: :width
      end
    end
  end
end
