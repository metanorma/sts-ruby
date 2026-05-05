# frozen_string_literal: true

# Shared injection helpers for NisoSts and IsoSts ContentGroups.
#
# Element tuple formats:
#   3-tuple: [name, type, xml_name]           -> collection
#   4-tuple: [name, type, xml_name, singular?] -> explicit

module Sts
  module ContentGroups
    module Helpers
      def inject_elements(klass, elements)
        elements.each do |name, type_name, _, is_collection|
          type = Object.const_get(type_name)
          coll = is_collection.nil? || is_collection
          klass.attribute name, type, collection: coll
        end
      end

      def inject_element_mappings(klass, elements)
        elements.each do |name, _, xml_name, _|
          klass.map_element xml_name, to: name
        end
      end
    end
  end
end
