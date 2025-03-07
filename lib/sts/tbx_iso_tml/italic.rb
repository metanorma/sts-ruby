# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class Italic < Lutaml::Model::Serializable
      attribute :value, :string
      attribute :sub, :string

      xml do
        root "italic", mixed: true
        namespace nil, nil

        map_content to: :value
        map_element "sub", to: :sub
      end
    end
  end
end
