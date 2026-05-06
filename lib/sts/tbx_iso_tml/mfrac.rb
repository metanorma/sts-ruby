# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Mfrac < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :mrow, ::Sts::TbxIsoTml::Mrow, collection: true
      attribute :mstyle, ::Sts::TbxIsoTml::Mstyle, collection: true
      attribute :bevelled, :string
      attribute :linethickness, :string
      attribute :mn, :string, collection: true
      attribute :mtext, :string, collection: true

      xml do
        element "mfrac"
        map_attribute "id", to: :id
        mixed_content
        namespace ::Sts::Namespaces::MathmlNamespace

        map_attribute "bevelled", to: :bevelled
        map_attribute "linethickness", to: :linethickness

        map_element "mrow", to: :mrow
        map_element "mn", to: :mn
        map_element "mtext", to: :mtext
        map_element "mstyle", to: :mstyle
      end
    end
  end
end
