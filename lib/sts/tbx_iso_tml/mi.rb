# frozen_string_literal: true

require "lutaml/model"
require_relative "mstyle"

module Sts
  module TbxIsoTml
    class Mi < Lutaml::Model::Serializable
      attribute :content, Lutaml::Model::Type::String

      xml do
        root "mi"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_content to: :content
      end
    end
  end
end
