# frozen_string_literal: true

module Sts
  module NisoSts
    class AuthorNotes < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, ::Sts::NisoSts::Title
      attribute :corresp, ::Sts::NisoSts::Corresp, collection: true
      attribute :fn, ::Sts::NisoSts::Fn, collection: true
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true

      xml do
        element "author-notes"
        ordered

        map_attribute "id", to: :id
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label
        map_element "title", to: :title
        map_element "corresp", to: :corresp
        map_element "fn", to: :fn
        map_element "p", to: :p
      end
    end
  end
end
