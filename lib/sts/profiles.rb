# frozen_string_literal: true

module Sts
  module Profiles
    # Raised when a usage profile is requested by a name this gem does not know.
    class UnknownProfileError < StandardError; end

    autoload :IsoIec, "#{__dir__}/profiles/iso_iec"

    # Returns the validator for a usage profile.
    #
    # A profile is a constraint layer over an already-parsed document, so
    # parsing is unaffected -- parse first, then validate:
    #
    #   doc = Sts::NisoSts::Standard.from_xml(xml)
    #   Sts::Profiles.validator(:iso_iec).validate(doc)
    #
    # Pass +id_scheme+ to additionally check ids against one of the semantic
    # ID schemes in Annex F of the IEC/ISO Coding Guidelines:
    #
    #   Sts::Profiles.validator(:iso_iec, id_scheme: :iso).validate(doc)
    #
    # Only +:iso_iec+ is currently available. An unknown +name+ raises
    # UnknownProfileError; an unknown +id_scheme+ raises ArgumentError.
    def self.validator(name, id_scheme: nil)
      unless name == :iso_iec
        raise UnknownProfileError, "unknown usage profile #{name.inspect}"
      end

      IsoIec::Validator.new(id_scheme: id_scheme)
    end
  end
end
