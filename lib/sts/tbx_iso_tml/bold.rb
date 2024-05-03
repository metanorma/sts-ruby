# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class Bold < Sts::Mapper
      attribute :value, Shale::Type::String

      xml do
        root "bold"
        namespace nil, nil

        map_content to: :value
      end
    end
  end
end
