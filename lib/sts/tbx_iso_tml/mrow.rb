# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class Mrow < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :mo, :string, collection: true
      attribute :mi, :string, collection: true
      attribute :mn, :string, collection: true
      attribute :mtext, :string, collection: true
      attribute :mrow, ::Sts::TbxIsoTml::Mrow
      attribute :mfrac, ::Sts::TbxIsoTml::Mfrac, collection: true
      attribute :mstyle, ::Sts::TbxIsoTml::Mstyle, collection: true
      attribute :msub, ::Sts::TbxIsoTml::Msub, collection: true
      attribute :msup, ::Sts::TbxIsoTml::Msup
      attribute :mfenced, ::Sts::TbxIsoTml::Mfenced, collection: true
      attribute :mspace, ::Sts::TbxIsoTml::Mspace, collection: true

      xml do
        element "mrow"
        mixed_content
        namespace ::Sts::Namespaces::MathmlNamespace

        map_element "mo", to: :mo
        map_element "mi", to: :mi
        map_element "mn", to: :mn
        map_element "mtext", to: :mtext
        map_element "mrow", to: :mrow
        map_element "mfrac", to: :mfrac
        map_element "mstyle", to: :mstyle
        map_element "msub", to: :msub
        map_element "msup", to: :msup
        map_element "mspace", to: :mspace
        map_element "mfenced", to: :mfenced
        map_content to: :content
      end
    end
  end
end
