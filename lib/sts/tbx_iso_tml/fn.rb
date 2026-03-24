# frozen_string_literal: true


module Sts
  module TbxIsoTml
    class Fn < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :label, :string
      attribute :p, ::Sts::NisoSts::Paragraph

      xml do
        element "fn"

        map_attribute "id", to: :id
        map_element "label", to: :label
        map_element "p", to: :p
      end
    end
  end
end
