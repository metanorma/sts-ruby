# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Mfenced < Lutaml::Model::Serializable
      attribute :separators, :string
      attribute :open, :string
      attribute :close, :string
      attribute :mo, :string, collection: true
      attribute :mn, :string, collection: true
      attribute :mi, :string
      attribute :mtext, :string
      attribute :mspace, ::Sts::TbxIsoTml::Mspace, collection: true
      attribute :msub, ::Sts::TbxIsoTml::Msub, collection: true
      attribute :mstyle, ::Sts::TbxIsoTml::Mstyle, collection: true
      attribute :mfrac, ::Sts::TbxIsoTml::Mfrac, collection: true

      xml do
        element "mfenced"
        mixed_content
        namespace ::Sts::Namespaces::MathmlNamespace

        map_attribute "separators", to: :separators,
                                    value_map: { to: { empty: :empty } }
        map_attribute "open", to: :open
        map_attribute "close", to: :close

        map_element "mo", to: :mo
        map_element "mn", to: :mn
        map_element "mi", to: :mi
        map_element "mspace", to: :mspace
        map_element "msub", to: :msub
        map_element "mstyle", to: :mstyle
        map_element "mfrac", to: :mfrac
      end
    end
  end
end
