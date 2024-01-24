# frozen_string_literal: true

require_relative "../mapper"
require_relative "../niso_sts/standard_ref"

module Sts
  module TbxIsoTml
    class Std < Sts::Mapper
      attribute :content, Shale::Type::String
      attribute :type, Shale::Type::String
      attribute :std_id, Shale::Type::String
      attribute :std_ref, Sts::NisoSts::StandardRef

      xml do
        root "std"

        map_content to: :content

        map_attribute "type", to: :type
        map_attribute "std-id", to: :std_id

        map_element "std-ref", to: :std_ref, namespace: nil, prefix: nil
      end
    end
  end
end
