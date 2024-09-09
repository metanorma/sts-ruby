# frozen_string_literal: true

require "lutaml/model"

require_relative "mspace"
require_relative "msub"
require_relative "mstyle"
require_relative "mfrac"

module Sts
  module TbxIsoTml
    class Mfenced < Lutaml::Model::Serializable
      attribute :separators, Lutaml::Model::Type::String
      attribute :open, Lutaml::Model::Type::String
      attribute :close, Lutaml::Model::Type::String
      attribute :mo, Lutaml::Model::Type::String, collection: true
      attribute :mn, Lutaml::Model::Type::String, collection: true
      attribute :mi, Lutaml::Model::Type::String
      attribute :mtext, Lutaml::Model::Type::String
      attribute :mspace, Mspace, collection: true
      attribute :msub, Msub, collection: true
      attribute :mstyle, Mstyle, collection: true
      attribute :mfrac, Mfrac, collection: true

      xml do
        root "mfenced", mixed: true
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_attribute "separators", to: :separators
        map_attribute "open", to: :open
        map_attribute "close", to: :close

        map_element "mo", to: :mo
        map_element "mn", to: :mn
        map_element "mi", to: :mi
        map_element "mspace", to: :mspace
        map_element "msub", to: :msub
        map_element "mstyle", to: :mstyle
        map_element "mfrac", to: :mfrac
      end
    end
  end
end
