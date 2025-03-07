# frozen_string_literal: true

require "lutaml/model"

require_relative "reference_list"
require_relative "reference_standard"

module Sts
  module NisoSts
    class TitleFull < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :std, ReferenceStandard

      xml do
        root "full", mixed: true

        map_content to: :content
        map_element "std", to: :std, namespace: nil, prefix: nil
      end
    end

    class TitleCompl < TitleFull
      xml do
        root "compl"

        map_content to: :content
        map_element "std", to: :std, namespace: nil, prefix: nil
      end
    end

    class TitleWrap < Lutaml::Model::Serializable
      attribute :intro, :string
      attribute :main, :string
      attribute :full, TitleFull
      attribute :compl, TitleCompl
      attribute :lang, :string

      xml do
        root "title-wrap", mixed: true
        map_attribute "lang", to: :lang,
                              namespace: "http://www.w3.org/XML/1998/namespace",
                              prefix: "xml"

        map_element "intro", to: :intro
        map_element "main", to: :main
        map_element "full", to: :full
        map_element "compl", to: :compl
      end
    end
  end
end
