# frozen_string_literal: true

require_relative "../niso_sts/paragraph"

module Sts
  module TbxIsoTml
    class Fn < Sts::Mapper
      attribute :id, Lutaml::Model::Type::String
      attribute :label, Lutaml::Model::Type::String
      attribute :p, Sts::NisoSts::Paragraph

      xml do
        root "fn"

        map_attribute "id", to: :id
        map_element "label", to: :label
        map_element "p", to: :p
      end
    end
  end
end
