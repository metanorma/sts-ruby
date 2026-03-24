# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Pronunciation < Lutaml::Model::Serializable
      attribute :value, :string

      xml do
        element "pronunciation"
        namespace ::Sts::Namespaces::TbxNamespace

        map_content to: :value
      end
    end
  end
end
