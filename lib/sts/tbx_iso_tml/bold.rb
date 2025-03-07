# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class Bold < Lutaml::Model::Serializable
      attribute :value, :string

      xml do
        root "bold"
        namespace nil, nil

        map_content to: :value
      end
    end
  end
end
