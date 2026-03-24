# frozen_string_literal: true


module Sts
  module NisoSts
    class FnGroup < Lutaml::Model::Serializable
      attribute :fn, ::Sts::NisoSts::Fn, collection: true

      xml do
        element "fn-group"

        map_element "fn", to: :fn
      end
    end
  end
end
