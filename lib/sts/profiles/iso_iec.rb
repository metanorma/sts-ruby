# frozen_string_literal: true

module Sts
  module Profiles
    module IsoIec
      autoload :Constraints, "#{__dir__}/iso_iec/constraints"
      autoload :Validator, "#{__dir__}/iso_iec/validator"
    end
  end
end
