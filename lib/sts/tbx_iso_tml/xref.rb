# frozen_string_literal: true

require_relative "../mapper"
require_relative "sup"

module Sts
  module TbxIsoTml
    class Xref < Sts::Mapper
      attribute :ref_type, Lutaml::Model::Type::String
      attribute :rid, Lutaml::Model::Type::String
      attribute :value, Lutaml::Model::Type::String
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
