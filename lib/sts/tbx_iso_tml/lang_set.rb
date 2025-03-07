# frozen_string_literal: true

require "lutaml/model"

require_relative "note"
require_relative "example"
require_relative "definition"
require_relative "see"
require_relative "source"
require_relative "external_source"
require_relative "term_information_group"

module Sts
  module TbxIsoTml
    class Definition < Lutaml::Model::Serializable; end
    class Note < Lutaml::Model::Serializable; end
    class Caption < Lutaml::Model::Serializable; end

    class LangSet < Lutaml::Model::Serializable
      attribute :lang, :string
      attribute :definition, Sts::TbxIsoTml::Definition, collection: true
      attribute :note, Note, collection: true
      attribute :example, Example, collection: true
      attribute :tig, TermInformationGroup, collection: true
      attribute :see, See, collection: true
      attribute :source, Source, collection: true
      attribute :x_source, ExternalSource, collection: true
      attribute :cross_reference, :string, collection: true
      attribute :subject_field, :string
      # attribute :x_graphic, ExternalGraphic, collection: true

      xml do
        root "langSet", mixed: true
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "lang", to: :lang,
                              namespace: "http://www.w3.org/XML/1998/namespace",
                              prefix: "xml"
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
