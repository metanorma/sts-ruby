# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class LangSet < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :lang, Lutaml::Xml::W3c::XmlLangType
      attribute :definition, ::Sts::TbxIsoTml::Definition, collection: true
      attribute :note, ::Sts::TbxIsoTml::Note, collection: true
      attribute :example, ::Sts::TbxIsoTml::Example, collection: true
      attribute :tig, ::Sts::TbxIsoTml::TermInformationGroup, collection: true
      attribute :see, ::Sts::TbxIsoTml::See, collection: true
      attribute :source, ::Sts::TbxIsoTml::Source, collection: true
      attribute :x_source, ::Sts::TbxIsoTml::ExternalSource, collection: true
      attribute :cross_reference, ::Sts::TbxIsoTml::CrossReference,
                collection: true
      attribute :subject_field, ::Sts::TbxIsoTml::SubjectField, collection: true
      # attribute :x_graphic, ::Sts::TbxIsoTml::ExternalGraphic, collection: true

      xml do
        element "langSet"
        map_attribute "id", to: :id
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "lang", to: :lang
        map_element "definition", to: :definition
        map_element "source", to: :source
        map_element "example", to: :example
        map_element "see", to: :see
        map_element "note", to: :note
        map_element "tig", to: :tig
        map_element "xSource", to: :x_source
        map_element "crossReference", to: :cross_reference
        map_element "subjectField", to: :subject_field
        # map_element 'xGraphic', to: :x_graphic
      end
    end
  end
end
