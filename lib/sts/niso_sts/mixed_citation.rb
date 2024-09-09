# frozen_striing_literal: true

require "lutaml/model"

require_relative "ext_link"
require_relative "reference_standard"

module Sts
  module NisoSts
    class MixedCitation < Lutaml::Model::Serializable
      attribute :content, Lutaml::Model::Type::String
      attribute :bold, Lutaml::Model::Type::String
      attribute :italic, Lutaml::Model::Type::String
      attribute :publication_type, Lutaml::Model::Type::String
      attribute :std, ReferenceStandard, collection: true
      attribute :ext_link, ExtLink

      xml do
        root "mixed-citation", mixed: true

        map_content to: :content

        map_attribute "publication-type", to: :publication_type

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "std", to: :std
        map_element "ext-link", to: :ext_link
      end
    end
  end
end
