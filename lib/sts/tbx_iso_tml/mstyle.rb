# frozen_string_literal: true

require "lutaml/model"
require_relative "mspace"

module Sts
  module TbxIsoTml
    class Mstyle < Lutaml::Model::Serializable
      attribute :mathvariant, :string
      attribute :mstyle, Mstyle
      attribute :mspace, Mspace, collection: true
      attribute :mi, :string, collection: true
      attribute :mn, :string, collection: true
      attribute :mo, :string, collection: true

      xml do
        root "mstyle", mixed: true
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_attribute "mathvariant", to: :mathvariant
        map_element "mi", to: :mi
        map_element "mn", to: :mn
        map_element "mo", to: :mo
        map_element "mstyle", to: :mstyle
        map_element "mspace", to: :mspace
      end
    end
  end
end
