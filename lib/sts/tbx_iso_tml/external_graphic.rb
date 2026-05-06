# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class ExternalGraphic < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :target, :string

      xml do
        element "xGraphic"
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "id", to: :id
        map_attribute "xtarget", to: :target
      end
    end
  end
end
