# frozen_string_literal: true

module Sts
  module NisoSts
    class MetaNote < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true
      attribute :title, :string

      xml do
        element "meta-note"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_element "p", to: :p
        map_element "title", to: :title
      end
    end
  end
end
