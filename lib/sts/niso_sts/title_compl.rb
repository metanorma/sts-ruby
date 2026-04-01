# frozen_string_literal: true

module Sts
  module NisoSts
    class TitleCompl < TitleFull
      xml do
        element "compl"

        map_content to: :content
        map_element "std", to: :std
      end
    end
  end
end
