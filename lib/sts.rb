# frozen_string_literal: true

require "lutaml/model"

module Sts
  autoload :IsoSts, "#{__dir__}/sts/iso_sts"
  autoload :Mathml, "#{__dir__}/sts/mathml"
  autoload :Namespaces, "#{__dir__}/sts/namespaces"
  autoload :NisoSts, "#{__dir__}/sts/niso_sts"
  autoload :VERSION, "#{__dir__}/sts/version"
  autoload :TbxIsoTml, "#{__dir__}/sts/tbx_iso_tml"
end
