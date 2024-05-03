# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class Col < Sts::Mapper
      attribute :width, Sts::TbxIsoTml::Col
      attribute :char, Sts::TbxIsoTml::Col
      attribute :charoff, Sts::TbxIsoTml::Col
      attribute :span, Sts::TbxIsoTml::Col

      xml do
        root "col"

        map_attribute "width", to: :width
        map_attribute "char", to: :char
        map_attribute "charoff", to: :charoff
        map_attribute "span", to: :span
      end
    end
  end
end
