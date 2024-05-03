# frozen_string_literal: true

require_relative "../mapper"

require_relative "semantics"
require_relative "mrow"
require_relative "msub"
require_relative "msup"
require_relative "mstyle"
require_relative "mspace"
require_relative "mfrac"
require_relative "mfenced"
require_relative "munderover"

module Sts
  module TbxIsoTml
    class Mfenced < Sts::Mapper; end

    class Math < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :content, Shale::Type::String
      attribute :display, Shale::Type::String
      attribute :mrow, Mrow
      attribute :msub, Msub
      attribute :msup, Msup
      attribute :mn, Shale::Type::String
      attribute :mo, Shale::Type::String
      attribute :mi, Shale::Type::String
      attribute :mtext, Shale::Type::String
      attribute :semantics, Semantics
      attribute :mstyle, Mstyle, collection: true
      attribute :mfenced, Mfenced, collection: true
      attribute :mspace, Mspace, collection: true
      attribute :mfrac, Mfrac, collection: true
      attribute :munderover, Munderover, collection: true

      xml do
        root "math"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_attribute "id", to: :id

        map_element "mrow", to: :mrow # , render_nil: true
        map_element "msub", to: :msub # , render_nil: true
        map_element "msup", to: :msup # , render_nil: true
        map_element "semantics", to: :semantics
        map_element "mn", to: :mn
        map_element "mi", to: :mi
        map_element "mtext", to: :mtext
        map_element "mo", to: :mo # , render_nil: true
        map_element "mstyle", to: :mstyle
        map_element "mspace", to: :mspace
        map_element "mfrac", to: :mfrac
        map_element "mfenced", to: :mfenced
        map_element "munderover", to: :munderover

        map_content to: :content
        map_attribute "display", to: :display
      end
    end
  end
end
