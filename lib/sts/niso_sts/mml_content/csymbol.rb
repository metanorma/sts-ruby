# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # csymbol: Content symbol (defined symbol)
      # Content: mixed (mglyph | PresentationExpression)*
      # Attributes: type (optional), cd (optional)
      class Csymbol < Object
        attribute :content, :string
        attribute :type, :string
        attribute :cd, :string

        xml do
          element "csymbol"

          map_content to: :content
          map_attribute "type", to: :type
          map_attribute "cd", to: :cd
        end
      end
    end
  end
end
