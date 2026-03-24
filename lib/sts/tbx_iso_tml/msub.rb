# frozen_string_literal: true


module Sts
  module TbxIsoTml
    class Msub < Lutaml::Model::Serializable
      attribute :mstyle, ::Sts::TbxIsoTml::Mstyle, collection: true
      attribute :mrow, ::Sts::TbxIsoTml::Mrow
      attribute :mspace, ::Sts::TbxIsoTml::Mspace
      attribute :mo, :string, collection: true
      attribute :mi, :string, collection: true
      attribute :mn, :string, collection: true
      attribute :mtext, :string, collection: true

      xml do
        element "msub"
        mixed_content
        namespace ::Sts::Namespaces::MathmlNamespace

        map_element "mstyle", to: :mstyle
        map_element "mo", to: :mo
        map_element "mi", to: :mi
        map_element "mn", to: :mn
        map_element "mrow", to: :mrow
        map_element "mtext", to: :mtext
        map_element "mspace", to: :mspace
      end
    end
  end
end
