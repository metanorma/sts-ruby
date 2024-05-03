# frozen_string_literal: true

require_relative "../mapper"

require_relative "table_wrap"
require_relative "entailed_term"
require_relative "math"
require_relative "sup"
require_relative "italic"
require_relative "xref"
require_relative "../niso_sts/list"
require_relative "../niso_sts/reference_standard"

module Sts
  module TbxIsoTml
    class Note < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :value, Shale::Type::String
      attribute :table_wrap, Sts::TbxIsoTml::TableWrap
      attribute :entailed_term, EntailedTerm
      attribute :math, Sts::TbxIsoTml::Math
      attribute :xref, Sts::TbxIsoTml::Xref
      attribute :list, Sts::NisoSts::List
      attribute :std, Sts::NisoSts::ReferenceStandard
      attribute :sup, Sup
      attribute :italic, Italic

      xml do
        root "note"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "id", to: :id
        map_content to: :value
        map_element "entailedTerm", to: :entailed_term
        map_element "list", to: :list, namespace: nil, prefix: nil
        map_element "table-wrap", to: :table_wrap, namespace: nil, prefix: nil
        map_element "std", to: :std, namespace: nil, prefix: nil
        map_element "sup", to: :sup, namespace: nil, prefix: nil
        map_element "italic", to: :italic, namespace: nil, prefix: nil
        map_element "xref", to: :xref, namespace: nil, prefix: nil
        map_element "math", to: :math,
                            namespace: "http://www.w3.org/1998/Math/MathML", prefix: "mml"
      end
    end
  end
end
