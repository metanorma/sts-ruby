# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class PartOfSpeech < Sts::Mapper
      # TODO: can be `noun`, `verb`, `adj`, `adv`
      attribute :value, Lutaml::Model::Type::String

      xml do
        root "partOfSpeech"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "value", to: :value
      end
    end
  end
end
