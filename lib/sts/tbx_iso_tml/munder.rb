# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Munder < Lutaml::Model::Serializable
      attribute :mrow, ::Sts::TbxIsoTml::Mrow, collection: true

      xml do
        element "munder"
        namespace ::Sts::Namespaces::MathmlNamespace

        map_element "mrow", to: :mrow
      end
    end
  end
end
