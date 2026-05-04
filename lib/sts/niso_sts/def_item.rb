# frozen_string_literal: true

module Sts
  module NisoSts
    class DefItem < Lutaml::Model::Serializable
      attribute :specific_use, :string
      attribute :term, ::Sts::NisoSts::Term
      attribute :definition, ::Sts::NisoSts::Def
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :see, ::Sts::NisoSts::See
      attribute :see_also, ::Sts::NisoSts::SeeAlso
      attribute :second, ::Sts::NisoSts::Term

      xml do
        element "def-item"
        ordered

        map_attribute "specific-use", to: :specific_use
        map_element "term", to: :term, render_nil: true
        map_element "def", to: :definition
        map_element "xref", to: :xref
        map_element "see", to: :see
        map_element "see-also", to: :see_also
        map_element "second", to: :second
      end
    end
  end
end
