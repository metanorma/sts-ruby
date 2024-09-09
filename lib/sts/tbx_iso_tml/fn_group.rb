# frozen_string_literal: true

require "lutaml/model"

require_relative "fn"

module Sts
  module TbxIsoTml
    class FnGroup < Lutaml::Model::Serializable
      attribute :fn, Sts::TbxIsoTml::Fn, collection: true

      xml do
        root "fn-group"

        map_element "fn", to: :fn
      end
    end
  end
end
