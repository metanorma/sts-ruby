# frozen_string_literal: true

require "lutaml/model"

require_relative "paragraph"

module Sts
  module NisoSts
    class Def < Lutaml::Model::Serializable
      attribute :paragraph, Paragraph

      xml do
        root "def"

        map_element "p", to: :paragraph
      end
    end
  end
end
