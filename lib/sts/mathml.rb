# frozen_string_literal: true

require "mml"

module Sts
  module Mathml
    # Wrapper around Mml::V3::Math for use within Sts document models.
    #
    # Mml::V3::Math is the actual serializable model. This class provides
    # a typed namespace at Sts::Mathml and forwards the small subset of
    # Mml::V3::Math interface used by Sts elements.
    #
    # All Mml element types (mi, mo, mn, mrow, etc.) are used directly
    # from Mml::V3 — only the root <math> wrapper lives here.
    class Math
      # Type alias for callers that prefer the Sts namespace path.
      # Maps directly to Mml::V3::Math with identical serialization.
      Root = Mml::V3::Math
    end
  end
end
