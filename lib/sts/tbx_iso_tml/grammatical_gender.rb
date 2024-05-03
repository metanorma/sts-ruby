# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class GrammaticalGender < Sts::Mapper
      # TODO: can be masculine, feminine, singular
      attribute :value, Shale::Type::String

      xml do
        root "grammaticalGender"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "value", to: :value
      end
    end
  end
end
