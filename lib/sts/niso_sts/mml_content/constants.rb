# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # Constants

      # integers: Set of integers
      class Integers < Object
        xml do
          element "integers"
        end
      end

      # reals: Set of real numbers
      class Reals < Object
        xml do
          element "reals"
        end
      end

      # rationals: Set of rational numbers
      class Rationals < Object
        xml do
          element "rationals"
        end
      end

      # naturalnumbers: Set of natural numbers
      class Naturalnumbers < Object
        xml do
          element "naturalnumbers"
        end
      end

      # complexes: Set of complex numbers
      class Complexes < Object
        xml do
          element "complexes"
        end
      end

      # primes: Set of prime numbers
      class Primes < Object
        xml do
          element "primes"
        end
      end

      # emptyset: Empty set
      class Emptyset < Object
        xml do
          element "emptyset"
        end
      end

      # exponentiale: Euler's number e
      class Exponentiale < Object
        xml do
          element "exponentiale"
        end
      end

      # imaginaryi: Imaginary unit i
      class Imaginaryi < Object
        xml do
          element "imaginaryi"
        end
      end

      # notanumber: NaN
      class Notanumber < Object
        xml do
          element "notanumber"
        end
      end

      # true: True
      class True < Object
        xml do
          element "true"
        end
      end

      # false: False
      class False < Object
        xml do
          element "false"
        end
      end

      # pi: Pi
      class Pi < Object
        xml do
          element "pi"
        end
      end

      # eulergamma: Euler-Mascheroni constant
      class Eulergamma < Object
        xml do
          element "eulergamma"
        end
      end

      # infinity: Infinity
      class Infinity < Object
        xml do
          element "infinity"
        end
      end
    end
  end
end
