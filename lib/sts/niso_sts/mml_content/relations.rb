# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # eq: Equality relation
      class Eq < Object
        xml do
          element "eq"
        end
      end

      # neq: Inequality relation (not equal)
      class Neq < Object
        xml do
          element "neq"
        end
      end

      # lt: Less than relation
      class Lt < Object
        xml do
          element "lt"
        end
      end

      # gt: Greater than relation
      class Gt < Object
        xml do
          element "gt"
        end
      end

      # leq: Less than or equal relation
      class Leq < Object
        xml do
          element "leq"
        end
      end

      # geq: Greater than or equal relation
      class Geq < Object
        xml do
          element "geq"
        end
      end

      # approx: Approximation relation
      class Approx < Object
        xml do
          element "approx"
        end
      end

      # factorof: Factor of relation
      class Factorof < Object
        xml do
          element "factorof"
        end
      end

      # tendsto: Tendsto relation (limit)
      class Tendsto < Object
        xml do
          element "tendsto"
        end
      end

      # implies: Implication
      class Implies < Object
        xml do
          element "implies"
        end
      end

      # equivalent: Logical equivalence
      class Equivalent < Object
        xml do
          element "equivalent"
        end
      end
    end
  end
end
