# frozen_string_literal: true

# Shared method to inject inside-cell XSD content group into a model class.
# This content group represents the elements allowed inside <td> and <th>.
#
# Call inside the class body:
#
#   ContentGroups.inside_cell(self)
#
# And inside xml do ... end:
#
#   ContentGroups.inside_cell_mappings(self)

module Sts
  module NisoSts
    module ContentGroups
      INSIDE_CELL_ELEMENTS = [
        [:bold, "Sts::TbxIsoTml::Bold", "bold"],
        [:italic, "Sts::TbxIsoTml::Italic", "italic"],
        [:xref, "Sts::TbxIsoTml::Xref", "xref"],
        [:std, "Sts::NisoSts::ReferenceStandard", "std"],
        [:list, "Sts::NisoSts::List", "list"],
        [:inline_formula, "Sts::NisoSts::InlineFormula", "inline-formula"],
        [:non_normative_note, "Sts::NisoSts::NonNormativeNote",
         "non-normative-note"],
        [:non_normative_example, "Sts::NisoSts::NonNormativeExample",
         "non-normative-example"],
        [:normative_note, "Sts::NisoSts::NormativeNote", "normative-note"],
        [:normative_example, "Sts::NisoSts::NormativeExample",
         "normative-example"],
        [:notes_group, "Sts::NisoSts::NotesGroup", "notes-group"],
        [:graphic, "Sts::NisoSts::Graphic", "graphic"],
        [:def_list, "Sts::NisoSts::DefList", "def-list"],
        [:p, "Sts::NisoSts::Paragraph", "p"],
        [:fn, "Sts::TbxIsoTml::Fn", "fn"],
        [:styled_content, "Sts::NisoSts::StyledContent", "styled-content"],
        [:monospace, "Sts::NisoSts::Monospace", "monospace"],
        [:underline, "Sts::NisoSts::Underline", "underline"],
        [:sup, "Sts::NisoSts::Sup", "sup"],
        [:sub, "Sts::NisoSts::Sub", "sub"],
        [:break, "Sts::TbxIsoTml::TableBreak", "break"],
        [:array, "Sts::NisoSts::SectionArray", "array"],
        [:fig, "Sts::NisoSts::Figure", "fig"],
        [:fig_group, "Sts::NisoSts::FigGroup", "fig-group"],
        [:media, "Sts::NisoSts::Media", "media"],
        [:disp_formula, "Sts::NisoSts::DisplayFormula", "disp-formula"],
        [:disp_formula_group, "Sts::NisoSts::DispFormulaGroup",
         "disp-formula-group"],
        [:math, "Sts::TbxIsoTml::Math", "math"],
        [:tex_math, "Sts::NisoSts::TexMath", "tex-math"],
        [:chem_struct, "Sts::NisoSts::ChemStruct", "chem-struct"],
        [:ext_link, "Sts::NisoSts::ExtLink", "ext-link"],
        [:uri, "Sts::NisoSts::Uri", "uri"],
        [:email, "Sts::NisoSts::Email", "email"],
        [:sc, "Sts::NisoSts::Sc", "sc"],
        [:overline, "Sts::NisoSts::Overline", "overline"],
        [:roman, "Sts::NisoSts::Roman", "roman"],
        [:sans_serif, "Sts::NisoSts::SansSerif", "sans-serif"],
        [:strike, "Sts::NisoSts::Strike", "strike"],
        [:ruby, "Sts::NisoSts::Ruby", "ruby"],
        [:named_content, "Sts::NisoSts::NamedContent", "named-content"],
        [:target, "Sts::NisoSts::Target", "target"],
        [:entailed_term, "Sts::TbxIsoTml::EntailedTerm", "entailedTerm"],
        [:inline_graphic, "Sts::NisoSts::InlineGraphic", "inline-graphic"],
        [:private_char, "Sts::NisoSts::PrivateChar", "private-char"],
        [:preformat, "Sts::NisoSts::Preformat", "preformat"],
        [:alternatives, "Sts::NisoSts::Alternatives", "alternatives"],
        [:address, "Sts::NisoSts::Address", "address"],
        [:related_article, "Sts::NisoSts::RelatedArticle", "related-article"],
        [:related_object, "Sts::NisoSts::RelatedObject", "related-object"],
        [:index_term, "Sts::NisoSts::IndexTerm", "index-term"],
        [:milestone_end, "Sts::NisoSts::MilestoneEnd", "milestone-end"],
        [:milestone_start, "Sts::NisoSts::MilestoneStart", "milestone-start"],
      ].freeze

      def self.inside_cell(klass)
        inject_elements(klass, INSIDE_CELL_ELEMENTS)
      end

      def self.inside_cell_mappings(klass)
        inject_element_mappings(klass, INSIDE_CELL_ELEMENTS)
      end

      INSIDE_CELL_ATTRIBUTES = %i[id content_type style abbr axis headers scope
                                  rowspan colspan align char charoff valign].freeze
      INSIDE_CELL_ATTR_XML = {
        id: "id", content_type: "content-type", style: "style",
        abbr: "abbr", axis: "axis", headers: "headers", scope: "scope",
        rowspan: "rowspan", colspan: "colspan", align: "align",
        char: "char", charoff: "charoff", valign: "valign"
      }.freeze

      def self.inside_cell_attributes(klass)
        INSIDE_CELL_ATTRIBUTES.each do |name|
          opts = case name
                 when :align then { values: EnumValues::ALIGN }
                 when :valign then { values: EnumValues::VALIGN }
                 when :scope then { values: EnumValues::SCOPE }
                 else {}
                 end
          klass.attribute name, :string, **opts
        end
      end

      def self.inside_cell_attribute_mappings(klass, char_value_map: false)
        INSIDE_CELL_ATTR_XML.each do |name, xml_name|
          opts = {}
          if char_value_map && name == :char
            opts[:value_map] = { to: { empty: :empty } }
          end
          klass.map_attribute xml_name, to: name, **opts
        end
      end
    end
  end
end
