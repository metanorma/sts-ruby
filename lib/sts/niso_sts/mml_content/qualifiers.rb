# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # bvar: Bound variable qualifier
      class Bvar < Object
        attribute :ci, Ci

        xml do
          element "bvar"

          map_element "ci", to: :ci
        end
      end

      # domainofapplication: Domain of application qualifier
      class Domainofapplication < Object
        attribute :content, :string

        xml do
          element "domainofapplication"

          map_content to: :content
        end
      end

      # condition: Condition qualifier
      class Condition < Object
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true

        xml do
          element "condition"

          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
        end
      end

      # lowlimit: Lower limit qualifier
      class Lowlimit < Object
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true

        xml do
          element "lowlimit"

          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
        end
      end

      # uplimit: Upper limit qualifier
      class Uplimit < Object
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true

        xml do
          element "uplimit"

          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
        end
      end

      # degree: Degree qualifier (for roots, etc.)
      class Degree < Object
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true

        xml do
          element "degree"

          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
        end
      end

      # momentabout: Moment about qualifier
      class Momentabout < Object
        xml do
          element "momentabout"
        end
      end

      # logbase: Logarithm base qualifier
      class Logbase < Object
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true

        xml do
          element "logbase"

          map_element "apply", to: :apply
          map_element "ci", to: :ci
          map_element "cn", to: :cn
        end
      end
    end
  end
end
