# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class TableWrapFoot < Lutaml::Model::Serializable
      attribute :fn_group, ::Sts::TbxIsoTml::FnGroup
      attribute :attrib, ::Sts::NisoSts::Attrib
      attribute :permissions, ::Sts::NisoSts::Permissions
      attribute :paragraph, ::Sts::NisoSts::Paragraph
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample
      attribute :fn, ::Sts::TbxIsoTml::Fn

      xml do
        element "table-wrap-foot"
        ordered

        map_element "fn-group", to: :fn_group
        map_element "attrib", to: :attrib
        map_element "permissions", to: :permissions
        map_element "p", to: :paragraph
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "fn", to: :fn
      end
    end
  end
end
