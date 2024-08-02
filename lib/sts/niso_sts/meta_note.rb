# frozen_string_literal: true

require_relative "../mapper"

require_relative "paragraph"

module Sts
  module NisoSts
    class MetaNote < Sts::Mapper
      attribute :id, Lutaml::Model::Type::String
      attribute :content_type, Lutaml::Model::Type::String
      attribute :p, Paragraph, collection: true
      attribute :title, Lutaml::Model::Type::String

      xml do
        root "meta-note", mixed: true

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_element "p", to: :p
        map_element "title", to: :title
      end
    end
  end
end
