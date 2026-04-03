# frozen_string_literal: true

module Sts
  module NisoSts
    module MmlContent
      # apply: Apply an operator to arguments
      # Content: operator, bvar*, qualifier*, ContExp*
      class Apply < Object
        attribute :apply, Apply, collection: true
        attribute :bind, Bind, collection: true
        attribute :ci, Ci, collection: true
        attribute :cn, Cn, collection: true
        attribute :csymbol, Csymbol, collection: true
        attribute :cbytes, Cbytes, collection: true
        attribute :cerror, Cerror, collection: true
        attribute :cs, Cs, collection: true
        attribute :share, Share, collection: true
        attribute :piecewise, Piecewise, collection: true
        attribute :plus, Plus, collection: true
        attribute :minus, Minus, collection: true
        attribute :times, Times, collection: true
        attribute :divide, Divide, collection: true
        attribute :power, Power, collection: true
        attribute :root, Root, collection: true
        attribute :abs, Abs, collection: true
        attribute :eq, Eq, collection: true
        attribute :neq, Neq, collection: true
        attribute :lt, Lt, collection: true
        attribute :gt, Gt, collection: true
        attribute :leq, Leq, collection: true
        attribute :geq, Geq, collection: true
        attribute :bvar, Bvar, collection: true
        attribute :lambda, Lambda, collection: true
        attribute :logbase, Logbase, collection: true
        attribute :degree, Degree, collection: true
        attribute :condition, Condition, collection: true
        attribute :domainofapplication, Domainofapplication, collection: true
        attribute :lowlimit, Lowlimit, collection: true
        attribute :uplimit, Uplimit, collection: true

        xml do
          element "apply"
        end
      end
    end
  end
end
