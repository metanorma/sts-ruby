# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Mspace < Lutaml::Model::Serializable
      attribute :width, :string

      xml do
        element "mspace"
        namespace ::Sts::Namespaces::MathmlNamespace

        map_attribute "width", to: :width
      end
    end
  end
end
