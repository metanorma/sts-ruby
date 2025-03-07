# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class See < Lutaml::Model::Serializable
      attribute :script, :string
      attribute :value, :string

      xml do
        root "see"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "script", to: :script
        map_content to: :value
      end
    end
  end
end
