# frozen_string_literal: true

require "lutaml/model"

require_relative "mrow"

module Sts
  module TbxIsoTml
    class Munder < Lutaml::Model::Serializable
      attribute :mrow, Mrow, collection: true

      xml do
        root "munder"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_element "mrow", to: :mrow
      end
    end
  end
end
