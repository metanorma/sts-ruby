# frozen_string_literal: true

module Sts
  module EnumValues
    ALIGN = %w[center char justify left right].freeze
    VALIGN = %w[baseline bottom middle top].freeze
    SCOPE = %w[col colgroup row rowgroup].freeze
    ORIENTATION = %w[landscape portrait].freeze
    POSITION = %w[anchor background float margin].freeze
    FRAME = %w[above below border box hsides lhs rhs void vsides].freeze
    RULES = %w[all cols groups none rows].freeze
    TOGGLE = %w[no yes].freeze
    ARRANGE = %w[stack stagger].freeze
    NAME_STYLE = %w[eastern given-only islensk western].freeze
    AUTHENTICATED = %w[false true].freeze
  end
end
