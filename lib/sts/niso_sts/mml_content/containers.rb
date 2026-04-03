# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # cbytes: Binary data element
      class Cbytes < Object
        attribute :content, :string

        xml do
          element "cbytes"

          map_content to: :content
        end
      end

      # cs: Arbitrary string element
      class Cs < Object
        attribute :content, :string

        xml do
          element "cs"

          map_content to: :content
        end
      end

      # share: Reference to shared expression
      class Share < Object
        attribute :src, :string, required: true

        xml do
          element "share"

          map_attribute "src", to: :src
        end
      end

      # cerror: Error element
      class Cerror < Object
        attribute :csymbol, Csymbol
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true

        xml do
          element "cerror"

          map_element "csymbol", to: :csymbol
          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
        end
      end

      # piece: Case in piecewise definition (defined before Piecewise)
      class Piece < Object
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true
        attribute :csymbol, Csymbol, collection: true

        xml do
          element "piece"

          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
          map_element "csymbol", to: :csymbol
        end
      end

      # otherwise: Default case in piecewise definition (defined before Piecewise)
      class Otherwise < Object
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true
        attribute :csymbol, Csymbol, collection: true

        xml do
          element "otherwise"

          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
          map_element "csymbol", to: :csymbol
        end
      end

      # piecewise: Piecewise definition (defined after Piece and Otherwise)
      class Piecewise < Object
        attribute :piece, Piece, collection: true
        attribute :otherwise, Otherwise

        xml do
          element "piecewise"

          map_element "piece", to: :piece
          map_element "otherwise", to: :otherwise
        end
      end
    end
  end
end
