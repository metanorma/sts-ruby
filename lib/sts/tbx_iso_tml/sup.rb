# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Sup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :value, :string
      attribute :xref, ::Sts::TbxIsoTml::Xref

      xml do
        element "sup"

        map_attribute "id", to: :id

        map_element "xref", to: :xref
        map_content to: :value
      end
    end
  end
end
