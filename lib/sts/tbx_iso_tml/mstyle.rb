# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class Mstyle < Lutaml::Model::Serializable
      attribute :mathvariant, :string
      attribute :mstyle, ::Sts::TbxIsoTml::Mstyle
      attribute :mspace, ::Sts::TbxIsoTml::Mspace, collection: true
      attribute :mi, :string, collection: true
      attribute :mn, :string, collection: true
      attribute :mo, :string, collection: true

      xml do
        element "mstyle"
        mixed_content
        namespace ::Sts::Namespaces::MathmlNamespace

        map_attribute "mathvariant", to: :mathvariant
        map_element "mi", to: :mi
        map_element "mn", to: :mn
        map_element "mo", to: :mo
        map_element "mstyle", to: :mstyle
        map_element "mspace", to: :mspace
      end
    end
  end
end
