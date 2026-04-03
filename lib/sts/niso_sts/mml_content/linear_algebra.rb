# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # vector: Vector
      class Vector < Object
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true
        attribute :bvar, Bvar, collection: true
        attribute :condition, Condition, collection: true

        xml do
          element "vector"

          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
          map_element "bvar", to: :bvar
          map_element "condition", to: :condition
        end
      end

      # matrixrow: Row in a matrix (defined before Matrix since Matrix references it)
      class Matrixrow < Object
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true
        attribute :vector, Vector, collection: true

        xml do
          element "matrixrow"

          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
          map_element "vector", to: :vector
        end
      end

      # matrix: Matrix
      class Matrix < Object
        attribute :matrixrow, Matrixrow, collection: true
        attribute :apply, Apply, collection: true

        xml do
          element "matrix"

          map_element "matrixrow", to: :matrixrow
          map_element "apply", to: :apply
        end
      end

      # determinant: Matrix determinant
      class Determinant < Object
        xml do
          element "determinant"
        end
      end

      # transpose: Matrix transpose
      class Transpose < Object
        xml do
          element "transpose"
        end
      end

      # vectorproduct: Vector product
      class Vectorproduct < Object
        xml do
          element "vectorproduct"
        end
      end

      # scalarproduct: Scalar product
      class Scalarproduct < Object
        xml do
          element "scalarproduct"
        end
      end

      # outerproduct: Outer product
      class Outerproduct < Object
        xml do
          element "outerproduct"
        end
      end

      # selector: Matrix/vector selector
      class Selector < Object
        xml do
          element "selector"
        end
      end
    end
  end
end
