# frozen_string_literal: true

module Sts
  module NisoSts
    class EditingInstruction < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :content, :string, collection: true
      attribute :label, ::Sts::NisoSts::Label

      xml do
        element "editing-instruction"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
        map_element "label", to: :label
      end
    end
  end
end
