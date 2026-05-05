# frozen_string_literal: true

# Shared method to inject table group attributes (id, content_type, style,
# align, char, charoff, valign) into table row/column models.
# Used by Thead, Tbody, Tfoot, Tr, Col, Colgroup in both NisoSts and IsoSts/TbxIsoTml.
#
# Call inside the class body:
#
#   ContentGroups.table_group_attributes(self)
#
# And inside xml do ... end:
#
#   ContentGroups.table_group_attribute_mappings(self, char_value_map: true)

module Sts
  module NisoSts
    module ContentGroups
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
