# frozen_string_literal: true


module Sts
  module NisoSts
    class ReferenceList < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :title, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :ref, ::Sts::NisoSts::Reference, collection: true

      xml do
        element "ref-list"

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_element "title", to: :title
        map_element "label", to: :label
        map_element "ref", to: :ref
      end
    end
  end
end
