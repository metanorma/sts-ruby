# frozen_string_literal: true

module Sts
  module IsoSts
    class TitleWrap < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_lang, :string
      attribute :intro, ::Sts::IsoSts::TitleIntro
      attribute :main, ::Sts::IsoSts::TitleMain
      attribute :compl, ::Sts::IsoSts::TitleCompl
      attribute :full, ::Sts::IsoSts::TitleFull

      xml do
        element "title-wrap"

        map_attribute "id", to: :id
        map_attribute "xml:lang", to: :xml_lang

        map_element "intro", to: :intro
        map_element "main", to: :main
        map_element "compl", to: :compl
        map_element "full", to: :full
      end
    end
  end
end
