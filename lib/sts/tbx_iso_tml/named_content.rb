# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class NamedContent < Lutaml::Model::Serializable
      attribute :content_type, Lutaml::Model::Type::String
      attribute :content, Lutaml::Model::Type::String

      xml do
        root "named-content"

        map_attribute "content-type", to: :content_type

        map_content to: :content
      end
    end
  end
end
