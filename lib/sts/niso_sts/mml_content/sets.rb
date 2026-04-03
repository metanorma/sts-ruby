# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # set: Set construction
      class Set < Object
        attribute :bvar, Bvar, collection: true
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true
        attribute :csymbol, Csymbol, collection: true
        attribute :condition, Condition, collection: true

        xml do
          element "set"

          map_element "bvar", to: :bvar
          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
          map_element "csymbol", to: :csymbol
          map_element "condition", to: :condition
        end
      end

      # list: List construction
      class List < Object
        attribute :bvar, Bvar, collection: true
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true
        attribute :csymbol, Csymbol, collection: true
        attribute :condition, Condition, collection: true

        xml do
          element "list"

          map_element "bvar", to: :bvar
          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
          map_element "csymbol", to: :csymbol
          map_element "condition", to: :condition
        end
      end

      # union: Set union
      class Union < Object
        xml do
          element "union"
        end
      end

      # intersect: Set intersection
      class Intersect < Object
        xml do
          element "intersect"
        end
      end

      # setdiff: Set difference
      class Setdiff < Object
        xml do
          element "setdiff"
        end
      end

      # cartesianproduct: Cartesian product
      class Cartesianproduct < Object
        xml do
          element "cartesianproduct"
        end
      end

      # card: Cardinality
      class Card < Object
        xml do
          element "card"
        end
      end
    end
  end
end
