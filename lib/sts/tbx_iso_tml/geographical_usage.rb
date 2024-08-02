# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class GeographicalUsage < Sts::Mapper
      attribute :value, Lutaml::Model::Type::String

      xml do
        root "geographicalUsage"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_content to: :value
      end
    end
  end
end
