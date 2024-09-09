# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class ExternalGraphic < Lutaml::Model::Serializable
      attribute :target, Lutaml::Model::Type::String

      xml do
        root "xGraphic"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "xtarget", to: :target
      end
    end
  end
end
