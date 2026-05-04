# frozen_string_literal: true

module Sts
  module NisoSts
    class SubjGroup < Lutaml::Model::Serializable
      attribute :subj_group_type, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :subject, ::Sts::NisoSts::Subject, collection: true

      xml do
        element "subj-group"
        ordered

        map_attribute "subj-group-type", to: :subj_group_type
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label
        map_element "subject", to: :subject
      end
    end
  end
end
