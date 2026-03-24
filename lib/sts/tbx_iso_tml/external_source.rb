# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class ExternalSource < Lutaml::Model::Serializable
      attribute :target, :string
      attribute :value, :string

      xml do
        element "xSource"
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "xtarget", to: :target
        map_content to: :value
      end
    end
  end
end
