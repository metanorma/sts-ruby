# frozen_string_literal: true

require_relative "../../content_groups/helpers"

# Shared content group methods for IsoSts models.
# Mirrors NisoSts::ContentGroups but uses IsoSts-specific type references.
#
# Content groups defined:
# - highlight_elements (21 elements) — used by Bold, Italic
# - styled_content_elements (31 elements) — used by StyledContent
# - p_elements (35 elements) — used by Paragraph
# - para_level (28 elements) — used by Sec, App, NonNormativeNote, NonNormativeExample, TermSec
# - inside_cell (40+ elements) — used by Td, Th

module Sts
  module IsoSts
    module ContentGroups
      extend ::Sts::ContentGroups::Helpers

      HIGHLIGHT_ELEMENTS = [
        [:bold, "Sts::IsoSts::Bold", "bold"],
        [:italic, "Sts::IsoSts::Italic", "italic"],
        [:sub, "Sts::NisoSts::Sub", "sub"],
        [:sup, "Sts::NisoSts::Sup", "sup"],
        [:monospace, "Sts::NisoSts::Monospace", "monospace"],
        [:sc, "Sts::NisoSts::Sc", "sc"],
        [:std_ref, "Sts::IsoSts::StdRef", "std-ref"],
        [:underline, "Sts::NisoSts::Underline", "underline"],
        [:strike, "Sts::NisoSts::Strike", "strike"],
        [:xref, "Sts::TbxIsoTml::Xref", "xref"],
        [:ext_link, "Sts::NisoSts::ExtLink", "ext-link"],
        [:fn, "Sts::TbxIsoTml::Fn", "fn"],
        [:styled_content, "Sts::IsoSts::StyledContent", "styled-content"],
        [:array, "Sts::IsoSts::Array", "array"],
        [:break, "Sts::IsoSts::Break", "break"],
        [:target, "Sts::NisoSts::Target", "target"],
        [:overline, "Sts::NisoSts::Overline", "overline"],
        [:roman, "Sts::NisoSts::Roman", "roman"],
        [:sans_serif, "Sts::NisoSts::SansSerif", "sans-serif"],
        [:ruby, "Sts::NisoSts::Ruby", "ruby"],
        [:named_content, "Sts::NisoSts::NamedContent", "named-content"],
        [:uri, "Sts::NisoSts::Uri", "uri"],
        [:inline_formula, "Sts::IsoSts::InlineFormula", "inline-formula"],
      ].freeze

      def self.highlight_elements(klass)
        inject_elements(klass, HIGHLIGHT_ELEMENTS)
      end

      def self.highlight_elements_mappings(klass)
        inject_element_mappings(klass, HIGHLIGHT_ELEMENTS)
      end

      STYLED_CONTENT_ELEMENTS = [
        *HIGHLIGHT_ELEMENTS,
        [:disp_formula, "Sts::IsoSts::DispFormula", "disp-formula"],
        [:disp_formula_group, "Sts::IsoSts::DispFormula", "disp-formula-group"],
        [:std, "Sts::IsoSts::Std", "std"],
        [:graphic, "Sts::IsoSts::Graphic", "graphic"],
        [:list, "Sts::IsoSts::List", "list"],
        [:def_list, "Sts::IsoSts::DefList", "def-list"],
        [:fig, "Sts::IsoSts::Fig", "fig"],
        [:boxed_text, "Sts::NisoSts::BoxedText", "boxed-text"],
        [:email, "Sts::NisoSts::Email", "email"],
      ].freeze

      def self.styled_content_elements(klass)
        inject_elements(klass, STYLED_CONTENT_ELEMENTS)
      end

      def self.styled_content_elements_mappings(klass)
        inject_element_mappings(klass, STYLED_CONTENT_ELEMENTS)
      end

      P_ELEMENTS_EXTRA = [
        [:non_normative_note, "Sts::IsoSts::NonNormativeNote",
         "non-normative-note"],
        [:non_normative_example, "Sts::IsoSts::NonNormativeExample",
         "non-normative-example"],
        [:math, "Sts::TbxIsoTml::Math", "math"],
        [:preformat, "Sts::IsoSts::Preformat", "preformat"],
      ].freeze

      def self.p_elements(klass)
        styled_content_elements(klass)
        inject_elements(klass, P_ELEMENTS_EXTRA)
      end

      def self.p_elements_mappings(klass)
        styled_content_elements_mappings(klass)
        inject_element_mappings(klass, P_ELEMENTS_EXTRA)
      end

      PARA_LEVEL_ELEMENTS = [
        [:label, "Sts::IsoSts::Label", "label"],
        [:title, "Sts::IsoSts::Title", "title"],
        [:p, "Sts::IsoSts::Paragraph", "p"],
        [:list, "Sts::IsoSts::List", "list"],
        [:def_list, "Sts::IsoSts::DefList", "def-list"],
        [:disp_formula, "Sts::IsoSts::DispFormula", "disp-formula"],
        [:inline_formula, "Sts::IsoSts::InlineFormula", "inline-formula"],
        [:table_wrap, "Sts::TbxIsoTml::TableWrap", "table-wrap"],
        [:fig, "Sts::IsoSts::Fig", "fig"],
        [:non_normative_note, "Sts::IsoSts::NonNormativeNote",
         "non-normative-note"],
        [:non_normative_example, "Sts::IsoSts::NonNormativeExample",
         "non-normative-example"],
        [:preformat, "Sts::IsoSts::Preformat", "preformat"],
        [:styled_content, "Sts::IsoSts::StyledContent", "styled-content"],
        [:array, "Sts::IsoSts::Array", "array"],
        [:graphic, "Sts::IsoSts::Graphic", "graphic"],
        [:std, "Sts::IsoSts::Std", "std"],
        [:ref_list, "Sts::IsoSts::RefList", "ref-list"],
        [:fn_group, "Sts::IsoSts::FnGroup", "fn-group"],
        [:xref, "Sts::TbxIsoTml::Xref", "xref"],
        [:ext_link, "Sts::NisoSts::ExtLink", "ext-link"],
        [:uri, "Sts::NisoSts::Uri", "uri"],
        [:sec, "Sts::IsoSts::Sec", "sec"],
        [:term_sec, "Sts::IsoSts::TermSec", "term-sec"],
        [:disp_quote, "Sts::NisoSts::DispQuote", "disp-quote"],
        [:fn, "Sts::TbxIsoTml::Fn", "fn"],
        [:editing_instruction, "Sts::NisoSts::EditingInstruction",
         "editing-instruction"],
      ].freeze

      def self.para_level(klass)
        inject_elements(klass, PARA_LEVEL_ELEMENTS)
      end

      def self.para_level_mappings(klass)
        inject_element_mappings(klass, PARA_LEVEL_ELEMENTS)
      end

      BODY_ELEMENTS = [
        [:p, "Sts::IsoSts::Paragraph", "p"],
        [:sec, "Sts::IsoSts::Sec", "sec"],
        [:term_sec, "Sts::IsoSts::TermSec", "term-sec"],
        [:list, "Sts::IsoSts::List", "list"],
        [:def_list, "Sts::IsoSts::DefList", "def-list"],
        [:disp_formula, "Sts::IsoSts::DispFormula", "disp-formula"],
        [:table_wrap, "Sts::TbxIsoTml::TableWrap", "table-wrap"],
        [:fig, "Sts::IsoSts::Fig", "fig"],
        [:non_normative_note, "Sts::IsoSts::NonNormativeNote",
         "non-normative-note"],
        [:non_normative_example, "Sts::IsoSts::NonNormativeExample",
         "non-normative-example"],
        [:preformat, "Sts::IsoSts::Preformat", "preformat"],
        [:styled_content, "Sts::IsoSts::StyledContent", "styled-content"],
        [:array, "Sts::IsoSts::Array", "array"],
        [:ref_list, "Sts::IsoSts::RefList", "ref-list"],
        [:disp_quote, "Sts::NisoSts::DispQuote", "disp-quote"],
        [:editing_instruction, "Sts::NisoSts::EditingInstruction",
         "editing-instruction"],
      ].freeze

      def self.body_elements(klass)
        inject_elements(klass, BODY_ELEMENTS)
      end

      def self.body_elements_mappings(klass)
        inject_element_mappings(klass, BODY_ELEMENTS)
      end

      INSIDE_CELL_ELEMENTS = [
        [:bold, "Sts::IsoSts::Bold", "bold"],
        [:italic, "Sts::IsoSts::Italic", "italic"],
        [:sub, "Sts::NisoSts::Sub", "sub"],
        [:sup, "Sts::NisoSts::Sup", "sup"],
        [:monospace, "Sts::NisoSts::Monospace", "monospace"],
        [:sc, "Sts::NisoSts::Sc", "sc"],
        [:underline, "Sts::NisoSts::Underline", "underline"],
        [:overline, "Sts::NisoSts::Overline", "overline"],
        [:roman, "Sts::NisoSts::Roman", "roman"],
        [:sans_serif, "Sts::NisoSts::SansSerif", "sans-serif"],
        [:strike, "Sts::NisoSts::Strike", "strike"],
        [:xref, "Sts::TbxIsoTml::Xref", "xref"],
        [:ext_link, "Sts::NisoSts::ExtLink", "ext-link"],
        [:uri, "Sts::NisoSts::Uri", "uri"],
        [:fn, "Sts::TbxIsoTml::Fn", "fn"],
        [:styled_content, "Sts::IsoSts::StyledContent", "styled-content"],
        [:array, "Sts::IsoSts::Array", "array"],
        [:break, "Sts::IsoSts::Break", "break"],
        [:target, "Sts::NisoSts::Target", "target"],
        [:named_content, "Sts::NisoSts::NamedContent", "named-content"],
        [:graphic, "Sts::IsoSts::Graphic", "graphic"],
        [:list, "Sts::IsoSts::List", "list"],
        [:def_list, "Sts::IsoSts::DefList", "def-list"],
        [:p, "Sts::IsoSts::Paragraph", "p"],
        [:non_normative_note, "Sts::IsoSts::NonNormativeNote",
         "non-normative-note"],
        [:non_normative_example, "Sts::IsoSts::NonNormativeExample",
         "non-normative-example"],
        [:inline_formula, "Sts::IsoSts::InlineFormula", "inline-formula"],
        [:disp_formula, "Sts::IsoSts::DispFormula", "disp-formula"],
        [:disp_formula_group, "Sts::IsoSts::DispFormula", "disp-formula-group"],
        [:std, "Sts::IsoSts::Std", "std"],
        [:fig, "Sts::IsoSts::Fig", "fig"],
        [:math, "Sts::TbxIsoTml::Math", "math"],
        [:ruby, "Sts::NisoSts::Ruby", "ruby"],
      ].freeze

      INSIDE_CELL_ATTRIBUTES = %i[id content_type style abbr axis headers scope
                                  rowspan colspan align char charoff valign].freeze
      INSIDE_CELL_ATTR_XML = {
        id: "id", content_type: "content-type", style: "style",
        abbr: "abbr", axis: "axis", headers: "headers", scope: "scope",
        rowspan: "rowspan", colspan: "colspan", align: "align",
        char: "char", charoff: "charoff", valign: "valign"
      }.freeze

      def self.inside_cell(klass)
        inject_elements(klass, INSIDE_CELL_ELEMENTS)
      end

      def self.inside_cell_mappings(klass)
        inject_element_mappings(klass, INSIDE_CELL_ELEMENTS)
      end

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

      TABLE_GROUP_ATTRS = %i[id content_type style align char charoff
                             valign].freeze
      TABLE_GROUP_ATTR_XML = {
        id: "id", content_type: "content-type", style: "style",
        align: "align", char: "char", charoff: "charoff", valign: "valign"
      }.freeze

      TABLE_COL_EXTRA_ATTRS = %i[span width].freeze
      TABLE_COL_EXTRA_ATTR_XML = { span: "span", width: "width" }.freeze

      def self.table_group_attributes(klass)
        TABLE_GROUP_ATTRS.each do |name|
          opts = case name
                 when :align then { values: EnumValues::ALIGN }
                 when :valign then { values: EnumValues::VALIGN }
                 else {}
                 end
          klass.attribute name, :string, **opts
        end
      end

      def self.table_group_attribute_mappings(klass, char_value_map: false)
        TABLE_GROUP_ATTR_XML.each do |name, xml_name|
          opts = {}
          if char_value_map && name == :char
            opts[:value_map] = { to: { empty: :empty } }
          end
          klass.map_attribute xml_name, to: name, **opts
        end
      end

      def self.table_col_attributes(klass)
        table_group_attributes(klass)
        TABLE_COL_EXTRA_ATTRS.each { |name| klass.attribute name, :string }
      end

      def self.table_col_attribute_mappings(klass, char_value_map: false)
        table_group_attribute_mappings(klass, char_value_map: char_value_map)
        TABLE_COL_EXTRA_ATTR_XML.each do |name, xml_name|
          klass.map_attribute xml_name, to: name
        end
      end
    end
  end
end
