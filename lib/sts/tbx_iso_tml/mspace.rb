# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class Mspace < Lutaml::Model::Serializable
      attribute :width, Lutaml::Model::Type::String

      xml do
        root "mspace"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_attribute "width", to: :width
      end
    end
  end
end
