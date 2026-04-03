# frozen_string_literal: true

require "lutaml/model"

module Sts
  module Mathml
    class Math < Lutaml::Model::Serializable
      # Delegate to Mml::V3::Math for actual MathML handling
      attribute :id, :string
      attribute :display, :string
      attribute :math, Mml::V3::Math

      xml do
        namespace ::Sts::Namespaces::MathmlNamespace
        element "math"
        mixed_content

        map_attribute :id, to: :id
        map_attribute :display, to: :display
        map_element "math", to: :math
      end

      def id
        @id ||= math&.id
      end

      def id=(value)
        @id = value
        math.id = value if math
      end

      def display
        @display ||= math&.display
      end

      def display=(value)
        @display = value
        math.display = value if math
      end

      # Forward missing methods to the underlying math object
      def method_missing(method_name, *args, &block)
        if math.respond_to?(method_name)
          math.send(method_name, *args, &block)
        else
          super
        end
      end

      def respond_to_missing?(method_name, include_private = false)
        math.respond_to?(method_name, include_private) || super
      end

      def to_xml
        math&.to_xml
      end

      def self.from_xml(input)
        # Parse the inner math element and wrap it
        parsed = Mml::V3::Math.from_xml(input)
        math = new
        math.instance_variable_set(:@math, parsed)
        math.id = parsed.id
        math.display = parsed.display
        math
      end
    end
  end
end
