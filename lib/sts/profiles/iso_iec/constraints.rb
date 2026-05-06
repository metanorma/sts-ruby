# frozen_string_literal: true

module Sts
  module Profiles
    module IsoIec
      module Constraints
        REQUIRED_ID_ELEMENTS = %w[
          sec app fig table-wrap disp-formula ref-list ref p term-sec
          graphic boxed-text list def-list non-normative-note
        ].freeze

        REQUIRED_FRONT_CHILDREN = %w[
          std-meta
        ].freeze

        REQUIRED_STD_META_CHILDREN = %w[
          std-ident doc-ref release-version
        ].freeze

        REQUIRED_STD_IDENT_CHILDREN = %w[
          originator doc-type doc-number
        ].freeze

        ID_PATTERNS = {
          "sec" => /\Asec_\d+(\.\d+)*\z/,
          "app" => /\A(app|annex)_[A-Z]\z/,
          "fig" => /\Afig_[A-Z\d]+\z/,
          "table-wrap" => /\Atab_[A-Z\d]+\z/,
          "disp-formula" => /\Afor_[A-Z\d]+\z/,
          "ref" => /\Aref_\d+\z/,
          "term-sec" => /\Aterm_\d+(\.\d+)*\z/,
          "p" => /\Ap_[\w.]+\z/,
        }.freeze

        STD_ID_TYPES = %w[dated undated isbn doi].freeze

        ORIGINATORS = %w[ISO IEC ISO/IEC ISO/IEEE IEC/ISO].freeze

        DOCUMENT_TYPES = %w[is tr ts pas guide cor amd].freeze
      end
    end
  end
end
