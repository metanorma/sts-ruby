# frozen_string_literal: true

module Sts
  module Profiles
    module IsoIec
      # One of the semantic ID schemes tabulated in Annex F of the NISO STS 1.2
      # IEC/ISO Coding Guidelines (ed. 2.1).
      #
      # Annex F warns that "IDs generated in OSD are arbitrary" and that it is
      # "not recommended to base any exploitation of ISO or IEC XML on semantic
      # IDs". Scheme checking is therefore opt-in, never a default.
      class IdScheme
        # Element name => documented id prefix. Restricted to the elements both
        # Annex F.1 (IEC) and Annex F.2 (ISO) tabulate.
        SCHEMES = {
          iso: {
            "sec" => "sec_",
            "term-sec" => "sec_",
            "fig" => "fig_",
            "table-wrap" => "tab_",
            "disp-formula" => "formula_",
          }.freeze,
          iec: {
            "sec" => "sec-",
            "term-sec" => "con-",
            "fig" => "fig-",
            "table-wrap" => "tab-",
            "disp-formula" => "for-",
          }.freeze,
        }.freeze

        # Element name => [prefix, matcher], built once at load. Interpolating
        # the matcher per call instead is 18x slower, and a document can carry
        # thousands of ids.
        #
        # ISO/CS prefixes ids with a document identifier, e.g.
        # iso_10993-1_2009_en_fig_1, so the prefix may follow a separator.
        MATCHERS = SCHEMES.transform_values do |prefixes|
          prefixes.to_h do |element, prefix|
            [element, [prefix, /(?:\A|[_-])#{Regexp.escape(prefix)}/].freeze]
          end.freeze
        end.freeze

        def initialize(name)
          @name = name
          @matchers = MATCHERS.fetch(name) do
            raise ArgumentError, "unknown ISO/IEC id scheme #{name.inspect}"
          end
        end

        # Returns a message describing how +id+ departs from this scheme, or
        # nil when it conforms. Elements the scheme does not cover are not
        # checked.
        def violation(element, id)
          prefix, matcher = @matchers[element]
          return if prefix.nil? || id.match?(matcher)

          "<#{element}> id '#{id}' does not follow the #{@name} ID scheme " \
            "(expected prefix '#{prefix}')"
        end
      end
    end
  end
end
