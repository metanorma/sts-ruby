# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class Caption < Sts::Mapper
      attribute :p, Lutaml::Model::Type::String

      xml do
        root "caption"

        map_element "p", to: :p
      end
    end
  end
end
