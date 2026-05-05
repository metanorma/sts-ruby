# frozen_string_literal: true

require_relative "../../content_groups/helpers"

# Shared method to inject emphasized-text XSD content group into a model class.
# Call inside the class body (not inside xml do ... end):
#
#   class MyElement < Lutaml::Model::Serializable
#     Sts::NisoSts::ContentGroups.emphasized_text(self)
#     ...
#   end
#
# And inside xml do ... end:
#
#   Sts::NisoSts::ContentGroups.emphasized_text_mappings(self)
#
module Sts
  module NisoSts
    module ContentGroups
      extend ::Sts::ContentGroups::Helpers

      # [ruby_name, type_class_name, xml_element_name]
      EMPHASIZED_TEXT_ELEMENTS = [
        [:bold, "Sts::TbxIsoTml::Bold", "bold"],
        [:italic, "Sts::TbxIsoTml::Italic", "italic"],
        [:monospace, "Sts::NisoSts::Monospace", "monospace"],
        [:overline, "Sts::NisoSts::Overline", "overline"],
        [:roman, "Sts::NisoSts::Roman", "roman"],
        [:sans_serif, "Sts::NisoSts::SansSerif", "sans-serif"],
        [:sc, "Sts::NisoSts::Sc", "sc"],
        [:strike, "Sts::NisoSts::Strike", "strike"],
        [:underline, "Sts::NisoSts::Underline", "underline"],
        [:ruby, "Sts::NisoSts::Ruby", "ruby"],
        [:sub, "Sts::NisoSts::Sub", "sub"],
        [:sup, "Sts::NisoSts::Sup", "sup"],
        [:styled_content, "Sts::NisoSts::StyledContent", "styled-content"],
        [:named_content, "Sts::NisoSts::NamedContent", "named-content"],
        [:target, "Sts::NisoSts::Target", "target"],
        [:fn, "Sts::NisoSts::Fn", "fn"],
        [:xref, "Sts::TbxIsoTml::Xref", "xref"],
        [:ext_link, "Sts::NisoSts::ExtLink", "ext-link"],
        [:uri, "Sts::NisoSts::Uri", "uri"],
        [:email, "Sts::NisoSts::Email", "email"],
        [:inline_graphic, "Sts::NisoSts::InlineGraphic", "inline-graphic"],
        [:private_char, "Sts::NisoSts::PrivateChar", "private-char"],
        [:inline_formula, "Sts::NisoSts::InlineFormula", "inline-formula"],
        [:chem_struct, "Sts::NisoSts::ChemStruct", "chem-struct"],
        [:tex_math, "Sts::NisoSts::TexMath", "tex-math"],
        [:math, "Sts::TbxIsoTml::Math", "math"],
        [:std, "Sts::NisoSts::ReferenceStandard", "std"],
        [:std_ref, "Sts::NisoSts::StandardRef", "std-ref"],
        [:related_article, "Sts::NisoSts::RelatedArticle", "related-article"],
        [:related_object, "Sts::NisoSts::RelatedObject", "related-object"],
        [:inline_supplementary_material,
         "Sts::NisoSts::InlineSupplementaryMaterial", "inline-supplementary-material"],
      ].freeze

      def self.emphasized_text(klass)
        inject_elements(klass, EMPHASIZED_TEXT_ELEMENTS)
      end

      def self.emphasized_text_mappings(klass)
        inject_element_mappings(klass, EMPHASIZED_TEXT_ELEMENTS)
      end
    end
  end
end
