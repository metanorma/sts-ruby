# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class ExternalSource < Lutaml::Model::Serializable
      attribute :target, :string
      attribute :value, :string

      xml do
        root "xSource"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "xtarget", to: :target
        map_content to: :value
      end
    end
  end
end
