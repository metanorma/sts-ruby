# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Source < Lutaml::Model::Serializable
      attribute :value, :string, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :sup, ::Sts::TbxIsoTml::Sup, collection: true

      xml do
        element "source"
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_content to: :value
        map_element "italic", to: :italic
        map_element "xref", to: :xref
        map_element "sup", to: :sup
      end
    end
  end
end
