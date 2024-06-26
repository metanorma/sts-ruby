# frozen_string_literal: true

require "shale"

require_relative "../niso_sts/paragraph"

module Sts
  module TbxIsoTml
    class Fn < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :label, Shale::Type::String
      attribute :p, Sts::NisoSts::Paragraph

      xml do
        root "fn"

        map_attribute "id", to: :id
        map_element "label", to: :label
        map_element "p", to: :p
      end
    end
  end
end
