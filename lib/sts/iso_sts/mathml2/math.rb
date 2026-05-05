# frozen_string_literal: true

require "nokogiri"

module Sts
  module IsoSts
    module Mathml2
      class Math < Lutaml::Model::Serializable
        attribute :id, :string
        attribute :display, :string
        attribute :content, :string, collection: true
        xml do
          namespace ::Sts::Namespaces::MathmlNamespace
          element "math"
          mixed_content
          map_attribute :id, to: :id
          map_attribute :display, to: :display
          map_content to: :content
        end

        MATH_NS = "http://www.w3.org/1998/Math/MathML"

        def to_xml(*)
          @original_xml || %{<math xmlns="#{MATH_NS}"/>}
        end

        def self.from_xml(input)
          input_str = input.respond_to?(:read) ? input.read : input.to_s

          doc = parse_with_namespace(input_str)
          math_element = find_math_element(doc)
          return new if math_element.nil?

          math = new
          math.id = math_element["id"]
          math.display = math_element["display"]
          math.content = extract_inner_content(math_element)
          math.instance_variable_set(:@original_xml, math_element.to_xml)
          math
        end

        def self.parse_with_namespace(xml_str)
          # Detect namespace-prefixed math elements and wrap to resolve prefixes
          if xml_str.include?("<mml:") || xml_str.match?(/<\w+:math[\s>]/)
            wrapped = "<wrapper xmlns:mml=\"#{MATH_NS}\">#{xml_str}</wrapper>"
            Nokogiri::XML(wrapped)
          else
            Nokogiri::XML(xml_str)
          end
        end
        private_class_method :parse_with_namespace

        def self.find_math_element(doc)
          doc.at_xpath("//math[@xmlns='#{MATH_NS}']") ||
            doc.at_xpath(".//mml:math", "mml" => MATH_NS) ||
            doc.at_xpath(".//*[local-name()='math']")
        end
        private_class_method :find_math_element

        def self.extract_inner_content(math_element)
          content = math_element.children.to_xml
          content.empty? ? nil : content
        end
        private_class_method :extract_inner_content
      end
    end
  end
end
