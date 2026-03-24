# frozen_string_literal: true


module Sts
  module TbxIsoTml
    class CrossReference < Lutaml::Model::Serializable
      attribute :value, :string

      xml do
        element "crossReference"
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_content to: :value
      end
    end
  end
end
