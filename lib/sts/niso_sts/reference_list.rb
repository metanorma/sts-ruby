# frozen_string_literal: true

module Sts
  module NisoSts
    class ReferenceList < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :title, ::Sts::NisoSts::Title
      attribute :label, ::Sts::NisoSts::Label
      attribute :ref, ::Sts::NisoSts::Reference, collection: true
      attribute :ref_list, ::Sts::NisoSts::ReferenceList, collection: true
      attribute :paragraph, ::Sts::NisoSts::Paragraph, collection: true

      xml do
        element "ref-list"
        ordered

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_element "title", to: :title
        map_element "label", to: :label
        map_element "ref", to: :ref
        map_element "ref-list", to: :ref_list
        map_element "p", to: :paragraph
      end
    end
  end
end
