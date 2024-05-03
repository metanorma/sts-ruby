# frozen_string_literal: true

require "shale"

require_relative "entailed_term"
require_relative "note"
require_relative "italic"
require_relative "math"
require_relative "../niso_sts/list"
require_relative "../niso_sts/reference_standard"

module Sts
  module TbxIsoTml
    class Definition < Sts::Mapper
      attribute :entailed_term, EntailedTerm
      attribute :note, Note
      attribute :value, Shale::Type::String
      attribute :italic, Italic
      attribute :math, Sts::TbxIsoTml::Math
      attribute :sub, Shale::Type::String
      attribute :list, Sts::NisoSts::List, collection: true
      attribute :std, Sts::NisoSts::ReferenceStandard, collection: true

      xml do
        root "definition"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_content to: :value
        map_element "entailedTerm", to: :entailed_term
        map_element "note", to: :note
        map_element "italic", to: :italic, namespace: nil, prefix: nil
        map_element "sub", to: :sub, namespace: nil, prefix: nil
        map_element "list", to: :list, namespace: nil, prefix: nil
        map_element "std", to: :std, namespace: nil, prefix: nil
        map_element "math", to: :math,
                            namespace: "http://www.w3.org/1998/Math/MathML",
                            prefix: "mml"
      end
    end
  end
end
