# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Bold < Lutaml::Model::Serializable
      attribute :value, :string

      xml do
        element "bold"

        map_content to: :value
      end
    end
  end
end
