# frozen_string_literal: true

module Sts
  module IsoSts
    class DispFormula < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :originator, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :math, ::Sts::IsoSts::Mathml2::Math
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample
      attribute :styled_content, ::Sts::IsoSts::StyledContent
      attribute :preformat, ::Sts::IsoSts::Preformat
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :tex_math, ::Sts::NisoSts::TexMath

      xml do
        element "disp-formula"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "originator", to: :originator

        map_element "label", to: :label
        map_element "math", to: :math
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "styled-content", to: :styled_content
        map_element "preformat", to: :preformat
        map_element "graphic", to: :graphic
        map_element "tex-math", to: :tex_math
      end
    end
  end
end
