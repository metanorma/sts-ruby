# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Msup < Lutaml::Model::Serializable
      attribute :mstyle, ::Sts::TbxIsoTml::Mstyle
      attribute :mrow, ::Sts::TbxIsoTml::Mrow, collection: true
      attribute :mi, :string
      attribute :mn, :string, collection: true

      xml do
        element "msup"
        ordered
        namespace ::Sts::Namespaces::MathmlNamespace

        map_element "mstyle", to: :mstyle
        map_element "mi", to: :mi
        map_element "mn", to: :mn
        map_element "mrow", to: :mrow
      end
    end
  end
end
