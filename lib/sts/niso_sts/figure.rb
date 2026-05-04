# frozen_string_literal: true

# <fig id="fig-1" orientation="portrait">
#   <label>Figure 1</label>
#   <caption...>
#   <graphic...>
# </fig>

module Sts
  module NisoSts
    class Figure < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :orientation, :string
      attribute :fig_type, :string
      attribute :caption, ::Sts::NisoSts::Caption
      attribute :def_list, ::Sts::NisoSts::DefList
      attribute :label, ::Sts::NisoSts::Label
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :title, ::Sts::NisoSts::Title
      attribute :paragraph, ::Sts::NisoSts::Paragraph, collection: true
      attribute :alternatives, ::Sts::NisoSts::Alternatives
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote, collection: true
      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap, collection: true

      xml do
        element "fig"
        ordered

        map_attribute "id", to: :id
        map_attribute "orientation", to: :orientation
        map_attribute "fig-type", to: :fig_type

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "graphic", to: :graphic
        map_element "def-list", to: :def_list
        map_element "title", to: :title
        map_element "p", to: :paragraph
        map_element "alternatives", to: :alternatives
        map_element "non-normative-note", to: :non_normative_note
        map_element "table-wrap", to: :table_wrap
      end
    end
  end
end
