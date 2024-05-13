# frozen_string_literal: true

require_relative "../mapper"

require_relative "../tbx_iso_tml/sup"

module Sts
  module NisoSts
    class Label < Sts::Mapper
      attribute :content, Shale::Type::String
      attribute :sup, Sts::TbxIsoTml::Sup

      xml do
        root "label"

        map_content to: :content
        map_element "sup", to: :sup
      end
    end
  end
end
