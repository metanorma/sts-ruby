# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # cn: Content number (literal)
      # Content: mixed (mglyph | sep | PresentationExpression)*
      # Attributes: type (optional), base (optional)
      class Cn < Object
        attribute :content, :string
        attribute :type, :string
        attribute :base, :string

        xml do
          element "cn"

          map_content to: :content
          map_attribute "type", to: :type
          map_attribute "base", to: :base
        end
      end
    end
  end
end
