# frozen_string_literal: true

module Sts
  module NisoSts
    class OpenAccess < Lutaml::Model::Serializable
      xml do
        element "open-access"
        ordered
      end
    end
  end
end
