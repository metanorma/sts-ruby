# frozen_string_literal: true

require "lutaml/model"
require_relative "mfrac"
require_relative "mstyle"
require_relative "msub"
require_relative "msup"
require_relative "mspace"
require_relative "mfenced"

module Sts
  module TbxIsoTml
    class Mrow < Lutaml::Model::Serializable
      attribute :content, Lutaml::Model::Type::String
      attribute :mo, Lutaml::Model::Type::String, collection: true
      attribute :mi, Lutaml::Model::Type::String, collection: true
      attribute :mn, Lutaml::Model::Type::String, collection: true
      attribute :mtext, Lutaml::Model::Type::String, collection: true
      attribute :mrow, Mrow
      attribute :mfrac, Mfrac, collection: true
      attribute :mstyle, Mstyle, collection: true
      attribute :msub, Msub, collection: true
      attribute :msup, Msup
      attribute :mfenced, Mfenced, collection: true
      attribute :mspace, Mspace, collection: true

      xml do
        root "mrow", mixed: true
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_element "mo", to: :mo
        map_element "mi", to: :mi
        map_element "mn", to: :mn
        map_element "mtext", to: :mtext
        map_element "mrow", to: :mrow
        map_element "mfrac", to: :mfrac
        map_element "mstyle", to: :mstyle
        map_element "msub", to: :msub
        map_element "msup", to: :msup
        map_element "mspace", to: :mspace
        map_element "mfenced", to: :mfenced
        map_content to: :content
      end
    end
  end
end
