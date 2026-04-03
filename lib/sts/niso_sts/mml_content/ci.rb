# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # ci: Content identifier (variable)
      # Content: mixed (mglyph | PresentationExpression)*
      # Attributes: type (optional)
      class Ci < Object
        attribute :content, :string
        attribute :type, :string

        xml do
          element "ci"

          map_content to: :content
          map_attribute "type", to: :type
        end
      end
    end
  end
end
