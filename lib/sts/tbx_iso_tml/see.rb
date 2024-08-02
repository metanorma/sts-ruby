# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class See < Sts::Mapper
      attribute :script, Lutaml::Model::Type::String
      attribute :value, Lutaml::Model::Type::String

      xml do
        root "see"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "script", to: :script
        map_content to: :value
      end
    end
  end
end
