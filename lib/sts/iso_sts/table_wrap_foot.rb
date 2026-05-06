# frozen_string_literal: true

module Sts
  module IsoSts
    class TableWrapFoot < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :title, ::Sts::IsoSts::Title
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample
      attribute :fn_group, ::Sts::IsoSts::FnGroup
      attribute :fn, ::Sts::IsoSts::Fn
      attribute :attrib, ::Sts::NisoSts::Attrib
      attribute :permissions, ::Sts::NisoSts::Permissions

      xml do
        element "table-wrap-foot"
        map_attribute "id", to: :id
        ordered

        map_element "title", to: :title
        map_element "p", to: :paragraph
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "fn-group", to: :fn_group
        map_element "fn", to: :fn
        map_element "attrib", to: :attrib
        map_element "permissions", to: :permissions
      end
    end
  end
end
