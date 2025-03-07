# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class NamedContent < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :content, :string

      xml do
        root "named-content"

        map_attribute "content-type", to: :content_type

        map_content to: :content
      end
    end
  end
end
