# frozen_string_literal: true


module Sts
  module NisoSts
    class TermSection < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :sec_type, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :term_entry, ::Sts::TbxIsoTml::TermEntry # , collection: true
      attribute :term_display, ::Sts::NisoSts::TermDisplay # , collection: true

      xml do
        element "term-sec"
        mixed_content
        map_attribute "id", to: :id
        map_attribute "sec-type", to: :sec_type

        map_element "label", to: :label
        map_element "term-display", to: :term_display
        map_element "termEntry", to: :term_entry
      end
    end
  end
end
