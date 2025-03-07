# frozen_string_literal: true

require "lutaml/model"

require_relative "../tbx_iso_tml/sup"

module Sts
  module NisoSts
    class Label < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :sup, Sts::TbxIsoTml::Sup

      xml do
        root "label"

        map_content to: :content
        map_element "sup", to: :sup
      end
    end
  end
end
