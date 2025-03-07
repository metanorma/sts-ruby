# frozen_string_literal: true

require "lutaml/model"

require_relative "italic"
require_relative "math"
require_relative "named_content"
require_relative "xref"

require_relative "../niso_sts/inline_formula"

module Sts
  module TbxIsoTml
    class Term < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :script, :string
      attribute :value, :string
      attribute :italic, Sts::TbxIsoTml::Italic
      attribute :bold, :string
      attribute :sub, :string
      attribute :math, Sts::TbxIsoTml::Math
      attribute :xref, Sts::TbxIsoTml::Xref
      attribute :inline_formula, Sts::NisoSts::InlineFormula, collection: true
      attribute :named_content, Sts::TbxIsoTml::NamedContent

      xml do
        root "term", mixed: true
        # namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "id", to: :id
        map_attribute "script", to: :script
        map_element "inline-formula", to: :inline_formula,
                                      namespace: nil,
                                      prefix: nil
        map_element "named-content", to: :named_content,
                                     namespace: nil,
                                     prefix: nil
        map_element "italic", to: :italic, namespace: nil, prefix: nil
        map_element "bold", to: :bold, namespace: nil, prefix: nil
        map_element "sub", to: :sub, namespace: nil, prefix: nil
        map_element "xref", to: :xref, namespace: nil, prefix: nil
        map_element "math", to: :math,
                            namespace: "http://www.w3.org/1998/Math/MathML",
                            prefix: "mml"
        map_content to: :value
      end
    end
  end
end
