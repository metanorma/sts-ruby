# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # lambda: Lambda expression for creating functions
      class Lambda < Object
        attribute :bvar, Bvar, collection: true
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true
        attribute :csymbol, Csymbol, collection: true

        xml do
          element "lambda"

          map_element "bvar", to: :bvar
          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
          map_element "csymbol", to: :csymbol
        end
      end

      # and: Logical AND
      class And < Object
        xml do
          element "and"
        end
      end

      # or: Logical OR
      class Or < Object
        xml do
          element "or"
        end
      end

      # xor: Logical XOR
      class Xor < Object
        xml do
          element "xor"
        end
      end

      # not: Logical NOT
      class Not < Object
        xml do
          element "not"
        end
      end

      # forall: Universal quantifier
      class Forall < Object
        xml do
          element "forall"
        end
      end

      # exists: Existential quantifier
      class Exists < Object
        xml do
          element "exists"
        end
      end

      # ident: Identity function
      class Ident < Object
        xml do
          element "ident"
        end
      end

      # inverse: Function inverse
      class Inverse < Object
        xml do
          element "inverse"
        end
      end

      # compose: Function composition
      class Compose < Object
        xml do
          element "compose"
        end
      end

      # domain: Domain of a function
      class Domain < Object
        xml do
          element "domain"
        end
      end

      # codomain: Codomain of a function
      class Codomain < Object
        xml do
          element "codomain"
        end
      end

      # image: Image of a function
      class Image < Object
        xml do
          element "image"
        end
      end
    end
  end
end
