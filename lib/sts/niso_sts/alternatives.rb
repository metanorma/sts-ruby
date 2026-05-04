# frozen_string_literal: true

module Sts
  module NisoSts
    class Alternatives < Lutaml::Model::Serializable
      xml do
        element "alternatives"
        ordered
      end
    end
  end
end
