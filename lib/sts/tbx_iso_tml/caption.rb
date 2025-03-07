# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class Caption < Lutaml::Model::Serializable
      attribute :p, :string

      xml do
        root "caption"

        map_element "p", to: :p
      end
    end
  end
end
