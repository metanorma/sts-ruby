# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class Italic < Sts::Mapper
      attribute :value, Lutaml::Model::Type::String
      attribute :sub, Lutaml::Model::Type::String

      xml do
        root "italic", mixed: true
        namespace nil, nil

        map_content to: :value
        map_element "sub", to: :sub
      end
    end
  end
end
