# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class ExternalGraphic < Lutaml::Model::Serializable
      attribute :target, :string

      xml do
        element "xGraphic"
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "xtarget", to: :target
      end
    end
  end
end
