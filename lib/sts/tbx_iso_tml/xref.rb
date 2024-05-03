# frozen_string_literal: true

require "shale"

require_relative "../mapper"
require_relative "sup"

module Sts
  module TbxIsoTml
    class Xref < Sts::Mapper
      attribute :ref_type, Shale::Type::String
      attribute :rid, Shale::Type::String
      attribute :value, Shale::Type::String
      attribute :sup, Sup

      xml do
        root "xref"

        map_attribute "ref-type", to: :ref_type
        map_attribute "rid", to: :rid
        map_element "sup", to: :sup
        map_content to: :value
      end
    end
  end
end
