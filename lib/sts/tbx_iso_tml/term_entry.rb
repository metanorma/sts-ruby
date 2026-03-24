# frozen_string_literal: true


module Sts
  module TbxIsoTml
    class TermEntry < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :lang_set, ::Sts::TbxIsoTml::LangSet, collection: true
      attribute :x_graphic, ::Sts::TbxIsoTml::ExternalGraphic, collection: true

      xml do
        element "termEntry"
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "id", to: :id
        map_element "langSet", to: :lang_set
        map_element "xGraphic", to: :x_graphic
      end
    end
  end
end
