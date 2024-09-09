# frozen_string_literal: true

require "lutaml/model"
require_relative "mrow"
require_relative "mstyle"

module Sts
  module TbxIsoTml
    class Mrow < Lutaml::Model::Serializable; end

    class Mfrac < Lutaml::Model::Serializable
      attribute :mrow, Mrow, collection: true
      attribute :mstyle, Mstyle, collection: true
      attribute :bevelled, Lutaml::Model::Type::String
      attribute :linethickness, Lutaml::Model::Type::String
      attribute :mn, Lutaml::Model::Type::String, collection: true
      attribute :mtext, Lutaml::Model::Type::String, collection: true

      xml do
        root "mfrac", mixed: true
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_attribute "bevelled", to: :bevelled
        map_attribute "linethickness", to: :linethickness

        map_element "mrow", to: :mrow
        map_element "mn", to: :mn
        map_element "mtext", to: :mtext
        map_element "mstyle", to: :mstyle
      end
    end
  end
end
