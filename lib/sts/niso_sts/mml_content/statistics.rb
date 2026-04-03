# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # mean: Mean (average)
      class Mean < Object
        xml do
          element "mean"
        end
      end

      # sdev: Standard deviation
      class Sdev < Object
        xml do
          element "sdev"
        end
      end

      # variance: Variance
      class Variance < Object
        xml do
          element "variance"
        end
      end

      # median: Median
      class Median < Object
        xml do
          element "median"
        end
      end

      # mode: Mode
      class Mode < Object
        xml do
          element "mode"
        end
      end

      # moment: Moment
      class Moment < Object
        xml do
          element "moment"
        end
      end
    end
  end
end
