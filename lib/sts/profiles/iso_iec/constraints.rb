# frozen_string_literal: true

module Sts
  module Profiles
    module IsoIec
      module Constraints
        # Annex F.2 of the Guidelines rules ids out on several elements a wider
        # list would sweep in: "No ids or other attributes used for <p>", "No id
        # attribute in any <list> or <list-item>", "No id attribute in
        # <non-normative-note>". The elements below are the ones both Annex F
        # and the reference documents in this repository consistently carry an
        # id on.
        REQUIRED_ID_ELEMENTS = %w[
          sec app fig table-wrap disp-formula term-sec ref
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

        # <comm-ref> spells out the organization at ISO but not at IEC. These
        # are the literal examples given in the Guidelines, not patterns -- no
        # document in this repository carries a non-empty <comm-ref>, so there
        # is nothing to validate a pattern against.
        COMM_REF_EXAMPLES = {
          "ISO" => "ISO/TC 126/SC 1",
          "IEC" => "TC 25",
        }.freeze

        STD_ID_TYPES = %w[dated undated isbn doi].freeze

        ORIGINATORS = %w[ISO IEC ISO/IEC ISO/IEEE IEC/ISO].freeze

        DOCUMENT_TYPES = %w[is tr ts pas guide cor amd].freeze
      end
    end
  end
end
