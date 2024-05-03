# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class ExternalGraphic < Sts::Mapper
      attribute :target, Shale::Type::String

      xml do
        root "xGraphic"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "xtarget", to: :target
      end
    end
  end
end
