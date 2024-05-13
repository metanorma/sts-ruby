# frozen_string_literal: true

require_relative "../mapper"

require_relative "reference_list"
require_relative "reference_standard"

module Sts
  module NisoSts
    class TitleFull < Sts::Mapper
      attribute :content, Shale::Type::String
      attribute :std, ReferenceStandard

      xml do
        root "full"
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

    class TitleWrap < Sts::Mapper
      attribute :intro, Shale::Type::String
      attribute :main, Shale::Type::String
      attribute :full, TitleFull
      attribute :compl, TitleCompl
      attribute :lang, Shale::Type::String

      xml do
        root "title-wrap"
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
