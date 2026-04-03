# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # int: Definite or indefinite integral
      class Int < Object
        xml do
          element "int"
        end
      end

      # diff: Differentiation
      class Diff < Object
        xml do
          element "diff"
        end
      end

      # partialdiff: Partial differentiation
      class Partialdiff < Object
        xml do
          element "partialdiff"
        end
      end

      # grad: Gradient
      class Grad < Object
        xml do
          element "grad"
        end
      end

      # divergence: Divergence
      class Divergence < Object
        xml do
          element "divergence"
        end
      end

      # curl: Curl
      class Curl < Object
        xml do
          element "curl"
        end
      end

      # laplacian: Laplacian operator
      class Laplacian < Object
        xml do
          element "laplacian"
        end
      end

      # sum: Summation
      class Sum < Object
        xml do
          element "sum"
        end
      end

      # product: Product
      class Product < Object
        xml do
          element "product"
        end
      end

      # limit: Limit
      class Limit < Object
        xml do
          element "limit"
        end
      end
    end
  end
end
