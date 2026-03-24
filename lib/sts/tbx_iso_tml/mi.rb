# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class Mi < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "mi"
        namespace ::Sts::Namespaces::MathmlNamespace

        map_content to: :content
      end
    end
  end
end
