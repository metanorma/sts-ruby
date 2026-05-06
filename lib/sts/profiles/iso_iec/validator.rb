# frozen_string_literal: true

module Sts
  module Profiles
    module IsoIec
      class Validator
        def validate(document)
          errors = []
          errors.concat(validate_structure(document))
          errors.concat(validate_metadata(document))
          errors
        end

        private

        def validate_structure(doc)
          errors = []
          errors << "ISO/IEC profile requires <front>" unless doc.front
          errors << "ISO/IEC profile requires <body>" unless doc.body
          errors
        end

        def validate_metadata(doc)
          return [] unless doc.front

          front = doc.front
          meta = front.std_meta || front.std_doc_meta || front.reg_meta
          meta ? validate_std_ident(meta) : []
        end

        def validate_std_ident(meta)
          ident = meta.std_ident
          return [] unless ident

          errors = validate_ident_fields(ident)
          errors.concat(validate_ident_values(ident))
          errors
        end

        def validate_ident_fields(ident)
          errors = []
          errors << "<std-ident> is missing <originator>" \
            if ident.originator.to_s.empty?
          errors << "<std-ident> is missing <doc-type>" \
            if ident.doc_type.to_s.empty?
          errors << "<std-ident> is missing <doc-number>" \
            if ident.doc_number.to_s.empty?
          errors
        end

        def validate_ident_values(ident)
          validate_originator(ident) + validate_doc_type(ident)
        end

        def validate_originator(ident)
          val = ident.originator.to_s
          return [] if val.empty? || Constraints::ORIGINATORS.include?(val)

          ["<originator> '#{val}' is not " \
           "a recognized ISO/IEC originator"]
        end

        def validate_doc_type(ident)
          val = ident.doc_type.to_s
          return [] if val.empty? || Constraints::DOCUMENT_TYPES.include?(val)

          ["<doc-type> '#{val}' is not " \
           "a recognized ISO/IEC document type"]
        end
      end
    end
  end
end
