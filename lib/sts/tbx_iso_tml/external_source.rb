# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class ExternalSource < Sts::Mapper
      attribute :target, Shale::Type::String
      attribute :value, Shale::Type::String

      xml do
        root "xSource"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "xtarget", to: :target
        map_content to: :value
      end
    end
  end
end
