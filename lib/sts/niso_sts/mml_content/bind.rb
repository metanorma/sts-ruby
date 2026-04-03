# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # bind: Bind variables in an expression
      # Content: binder, bvar+, ContExp*
      class Bind < Object
        attribute :bvar, Bvar, collection: true
        attribute :apply, Apply, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true
        attribute :csymbol, Csymbol, collection: true
        attribute :lambda, Lambda, collection: true

        xml do
          element "bind"
        end
      end
    end
  end
end
