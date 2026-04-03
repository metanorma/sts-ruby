# frozen_string_literal: true

module Sts
  module NisoSts
    class Anonymous < Lutaml::Model::Serializable
      xml do
        element "anonymous"
      end
    end
  end
end
