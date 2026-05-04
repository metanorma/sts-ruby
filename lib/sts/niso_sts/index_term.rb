# frozen_string_literal: true

module Sts
  module NisoSts
    class IndexTerm < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :index_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :term, ::Sts::NisoSts::Term
      attribute :index_term, ::Sts::NisoSts::IndexTerm, collection: true
      attribute :see, ::Sts::NisoSts::See, collection: true
      attribute :see_also, ::Sts::NisoSts::SeeAlso, collection: true

      xml do
        element "index-term"
        ordered

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "index-type", to: :index_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "term", to: :term
        map_element "index-term", to: :index_term
        map_element "see", to: :see
        map_element "see-also", to: :see_also
      end
    end
  end
end
