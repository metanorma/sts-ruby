# frozen_string_literal: true

require "lutaml/model"

require_relative "paragraph"

module Sts
  module NisoSts
    class MetaNote < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :p, Paragraph, collection: true
      attribute :title, :string

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
