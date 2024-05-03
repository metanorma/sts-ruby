# frozen_string_literal: true

require_relative "../mapper"

require_relative "italic"
require_relative "math"
require_relative "named_content"
require_relative "xref"

require_relative "../niso_sts/inline_formula"

module Sts
  module TbxIsoTml
    class Term < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :script, Shale::Type::String
      attribute :value, Shale::Type::String
      attribute :italic, Sts::TbxIsoTml::Italic
      attribute :bold, Shale::Type::String
      attribute :sub, Shale::Type::String
      attribute :math, Sts::TbxIsoTml::Math
      attribute :xref, Sts::TbxIsoTml::Xref
      attribute :inline_formula, Sts::NisoSts::InlineFormula
      attribute :named_content, Sts::TbxIsoTml::NamedContent

      xml do
        root "term"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "id", to: :id
        map_attribute "script", to: :script
        map_element "inline-formula", to: :inline_formula, namespace: nil, prefix: nil
        map_element "named-content", to: :named_content, namespace: nil, prefix: nil
        map_element "italic", to: :italic, namespace: nil, prefix: nil
        map_element "bold", to: :bold, namespace: nil, prefix: nil
        map_element "sub", to: :sub, namespace: nil, prefix: nil
        map_element "xref", to: :xref, namespace: nil, prefix: nil
        map_element "math", to: :math,
                            namespace: "http://www.w3.org/1998/Math/MathML", prefix: "mml"
        map_content to: :value
      end
    end
  end
end
