# frozen_string_literal: true

require "lutaml/model"

require_relative "mrow"
require_relative "munder"

module Sts
  module TbxIsoTml
    class Semantics < Lutaml::Model::Serializable
      attribute :mrow, Mrow, collection: true
      attribute :mo, Lutaml::Model::Type::String
      attribute :mtext, Lutaml::Model::Type::String
      attribute :munder, Sts::TbxIsoTml::Munder
      attribute :content, Lutaml::Model::Type::String

      xml do
        root "semantics", mixed: true
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_element "mrow", to: :mrow
        map_element "mo", to: :mo
        map_element "munder", to: :munder
        map_element "mtext", to: :mtext

        map_content to: :content
      end
    end
  end
end
