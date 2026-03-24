# frozen_string_literal: true


module Sts
  module NisoSts
    class TermDisplay < Lutaml::Model::Serializable
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote, collection: true

      xml do
        element "term-display"

        map_element "p", to: :p
        map_element "non-normative-note", to: :non_normative_note
      end
    end
  end
end
