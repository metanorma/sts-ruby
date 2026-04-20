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

        def to_xml(*)
          if content
            Nokogiri::XML(content, &:strict).root.to_xml
          elsif @original_xml
            @original_xml
          else
            %{<math xmlns="#{::Sts::Namespaces::MathmlNamespace.uri}"/>}
          end
        end

        MATH_XPATH = ".//*[local-name()='math']"
        MATH_NS_XPATH = ".//math[@xmlns='http://www.w3.org/1998/Math/MathML']"
        MATH_ML_XPATH = ".//mml:math"

        def self.from_xml(input)
          doc = Nokogiri::XML(input, &:strict)
          math_element = find_math_element(doc)
          return new if math_element.nil?

          math = new
          math.id = math_element["id"]
          math.display = math_element["display"]
          math.content = extract_inner_content(math_element)
          math.instance_variable_set(:@original_xml, math_element.to_xml)
          math
        end

        def self.find_math_element(doc)
          doc.at_xpath(MATH_NS_XPATH) ||
            doc.at_xpath(
              MATH_ML_XPATH,
              "mml" => "http://www.w3.org/1998/Math/MathML",
            ) ||
            doc.at_xpath(MATH_XPATH)
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
