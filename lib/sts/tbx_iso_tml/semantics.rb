# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Semantics < Lutaml::Model::Serializable
      attribute :mrow, ::Sts::TbxIsoTml::Mrow, collection: true
      attribute :mo, :string
      attribute :mtext, :string
      attribute :munder, ::Sts::TbxIsoTml::Munder
      attribute :content, :string, collection: true
      xml do
        element "semantics"
        mixed_content
        namespace ::Sts::Namespaces::MathmlNamespace

        map_element "mrow", to: :mrow
        map_element "mo", to: :mo
        map_element "munder", to: :munder
        map_element "mtext", to: :mtext

        map_content to: :content
      end
    end
  end
end
