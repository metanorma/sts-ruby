# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class GeographicalUsage < Lutaml::Model::Serializable
      attribute :value, Lutaml::Model::Type::String

      xml do
        root "geographicalUsage"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_content to: :value
      end
    end
  end
end
