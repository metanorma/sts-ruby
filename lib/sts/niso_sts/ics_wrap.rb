# frozen_string_literal: true

module Sts
  module NisoSts
    class IcsWrap < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :vocab, :string
      attribute :vocab_identifier, :string
      attribute :ics, ::Sts::NisoSts::Ics, collection: true

      xml do
        element "ics-wrap"

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "vocab", to: :vocab
        map_attribute "vocab-identifier", to: :vocab_identifier

        map_element "ics", to: :ics
      end
    end
  end
end
