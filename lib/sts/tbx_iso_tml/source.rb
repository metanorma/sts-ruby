# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Source < Lutaml::Model::Serializable
      attribute :value, :string, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic

      xml do
        element "source"
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_content to: :value
        map_element "italic", to: :italic
      end
    end
  end
end
