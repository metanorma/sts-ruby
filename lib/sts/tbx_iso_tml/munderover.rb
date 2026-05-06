# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Munderover < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :mo, :string
      attribute :mi, :string
      attribute :mrow, ::Sts::TbxIsoTml::Mrow, collection: true

      xml do
        element "munderover"
        map_attribute "id", to: :id
        mixed_content
        namespace ::Sts::Namespaces::MathmlNamespace

        map_element "mo", to: :mo
        map_element "mi", to: :mi
        map_element "mrow", to: :mrow
      end
    end
  end
end
