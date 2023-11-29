# frozen_string_literal: true

require "shale"

module Sts
  module TbxIsoTml
    class NormativeAuthorization < Shale::Mapper
      # TODO: can be: admittedTerm, preferredTerm, deprecatedTerm
      attribute :value, Shale::Type::String

      xml do
        root "normativeAuthorization"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "value", to: :value
      end
    end
  end
end
