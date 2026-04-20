# frozen_string_literal: true

module Sts
  module NisoSts
    class TitleFull < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard

      xml do
        element "full"
        mixed_content

        map_content to: :content
        map_element "std", to: :std
      end
    end

    class TitleCompl < TitleFull
      xml do
        element "compl"

        map_content to: :content
        map_element "std", to: :std
      end
    end

    class TitleWrap < Lutaml::Model::Serializable
      attribute :intro, :string
      attribute :main, :string
      attribute :full, ::Sts::NisoSts::TitleFull
      attribute :compl, ::Sts::NisoSts::TitleCompl
      attribute :lang, Lutaml::Xml::W3c::XmlLangType

      xml do
        element "title-wrap"
        mixed_content
        map_attribute "lang", to: :lang

        map_element "intro", to: :intro
        map_element "main", to: :main
        map_element "full", to: :full
        map_element "compl", to: :compl
      end
    end
  end
end
