# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # plus: Arithmetic addition operator
      class Plus < Object
        xml do
          element "plus"
        end
      end

      # minus: Arithmetic subtraction operator
      class Minus < Object
        xml do
          element "minus"
        end
      end

      # times: Arithmetic multiplication operator
      class Times < Object
        xml do
          element "times"
        end
      end

      # divide: Arithmetic division operator
      class Divide < Object
        xml do
          element "divide"
        end
      end

      # power: Exponentiation operator
      class Power < Object
        xml do
          element "power"
        end
      end

      # root: Root operation
      class Root < Object
        xml do
          element "root"
        end
      end

      # abs: Absolute value
      class Abs < Object
        xml do
          element "abs"
        end
      end

      # quotient: Integer quotient
      class Quotient < Object
        xml do
          element "quotient"
        end
      end

      # rem: Remainder operator
      class Rem < Object
        xml do
          element "rem"
        end
      end

      # gcd: Greatest common divisor
      class Gcd < Object
        xml do
          element "gcd"
        end
      end

      # lcm: Least common multiple
      class Lcm < Object
        xml do
          element "lcm"
        end
      end

      # factorial: Factorial operation
      class Factorial < Object
        xml do
          element "factorial"
        end
      end

      # conjugate: Complex conjugate
      class Conjugate < Object
        xml do
          element "conjugate"
        end
      end

      # arg: Argument of complex number
      class Arg < Object
        xml do
          element "arg"
        end
      end

      # real: Real part of complex
      class Real < Object
        xml do
          element "real"
        end
      end

      # imaginary: Imaginary part of complex
      class Imaginary < Object
        xml do
          element "imaginary"
        end
      end

      # floor: Floor function
      class Floor < Object
        xml do
          element "floor"
        end
      end

      # ceiling: Ceiling function
      class Ceiling < Object
        xml do
          element "ceiling"
        end
      end

      # exp: Exponential function
      class Exp < Object
        xml do
          element "exp"
        end
      end

      # ln: Natural logarithm
      class Ln < Object
        xml do
          element "ln"
        end
      end

      # log: Logarithm
      class Log < Object
        xml do
          element "log"
        end
      end
    end
  end
end
