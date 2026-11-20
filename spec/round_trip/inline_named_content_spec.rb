# frozen_string_literal: true

require "spec_helper"

# Every inline parent whose XSD content model allows named-content and/or
# target must carry them through a round trip. The table lists the classes
# that used to drop them (found by round-trip probe, not by grep).
RSpec.describe "Inline named-content and target round-trip" do # rubocop:disable RSpec/DescribeClass
  # [class, element, keeps named-content, keeps target]
  cases = {
    Sts::IsoSts => [
      [:Bold, "bold", false, true],
      [:CopyrightStatement, "copyright-statement", true, true],
      [:Italic, "italic", false, true],
      [:Label, "label", false, true],
      [:MixedCitation, "mixed-citation", false, true],
      [:Monospace, "monospace", true, true],
      [:NamedContent, "named-content", false, true],
      [:Preformat, "preformat", true, true],
      [:Sc, "sc", true, true],
      [:Strike, "strike", true, true],
      [:StyledContent, "styled-content", false, true],
      [:Sub, "sub", true, true],
      [:Sup, "sup", true, true],
      [:Td, "td", true, true],
      [:Term, "term", false, true],
      [:Th, "th", true, true],
      [:Title, "title", true, true],
      [:TitleCompl, "compl", true, true],
      [:TitleFull, "full", true, true],
      [:TitleIntro, "intro", true, true],
      [:TitleMain, "main", true, true],
      [:Underline, "underline", true, true],
    ],
    Sts::NisoSts => [
      [:AddrLine, "addr-line", true, true],
      [:Aff, "aff", true, true],
      [:AltTitle, "alt-title", true, true],
      [:ArticleTitle, "article-title", true, true],
      [:Attrib, "attrib", true, true],
      [:AwardId, "award-id", true, true],
      [:ChapterTitle, "chapter-title", true, true],
      [:ChemStruct, "chem-struct", true, true],
      [:Code, "code", false, true],
      [:Collab, "collab", true, true],
      [:Comment, "comment", true, true],
      [:CompoundKwdPart, "compound-kwd-part", true, true],
      [:ConfTheme, "conf-theme", true, true],
      [:CopyrightStatement, "copyright-statement", true, true],
      [:Corresp, "corresp", true, true],
      [:DefHead, "def-head", true, true],
      [:ExtLink, "ext-link", true, true],
      [:FundingSource, "funding-source", true, true],
      [:FundingStatement, "funding-statement", true, true],
      [:Gov, "gov", true, true],
      [:InlineSupplementaryMaterial, "inline-supplementary-material",
       true, true],
      [:Intro, "intro", true, true],
      [:Kwd, "kwd", true, true],
      [:Label, "label", true, true],
      [:LicenseP, "license-p", true, true],
      [:Main, "main", true, true],
      [:MixedCitation, "mixed-citation", true, true],
      [:Monospace, "monospace", true, true],
      [:OnBehalfOf, "on-behalf-of", true, true],
      [:Overline, "overline", true, true],
      [:Preformat, "preformat", true, true],
      [:Product, "product", true, true],
      [:ReferenceStandard, "std", true, true],
      [:RelatedArticle, "related-article", true, true],
      [:RelatedObject, "related-object", true, true],
      [:Roman, "roman", true, true],
      [:SansSerif, "sans-serif", true, true],
      [:Sc, "sc", true, true],
      [:See, "see", true, true],
      [:SeeAlso, "see-also", true, true],
      [:SeeAlsoEntry, "see-also-entry", true, true],
      [:SeeEntry, "see-entry", true, true],
      [:Series, "series", true, true],
      [:SeriesText, "series-text", true, true],
      [:SeriesTitle, "series-title", true, true],
      [:Sig, "sig", true, true],
      [:Speaker, "speaker", true, true],
      [:Strike, "strike", true, true],
      [:StringConf, "string-conf", true, true],
      [:Sub, "sub", true, true],
      [:Subject, "subject", true, true],
      [:Subtitle, "subtitle", true, true],
      [:Sup, "sup", true, true],
      [:Supplement, "supplement", true, true],
      [:Target, "target", true, false],
      [:Term, "term", false, true],
      [:TermHead, "term-head", true, true],
      [:TextualForm, "textual-form", true, true],
      [:Title, "title", true, true],
      [:TitleCompl, "compl", true, true],
      [:TitleFull, "full", true, true],
      [:TransSource, "trans-source", true, true],
      [:TransTitle, "trans-title", true, true],
      [:Underline, "underline", true, true],
      [:VerseLine, "verse-line", true, true],
    ],
  }

  def canonical(xml)
    Nokogiri::XML(xml, &:noblanks).canonicalize
  end

  def round_trip(klass, xml)
    klass.from_xml(xml).to_xml
  end

  def nc
    '<named-content content-type="k" specific-use="u" ' \
      'id="n1">n</named-content>'
  end

  def inputs
    {
      named_content: "a #{nc} b " \
                     '<named-content content-type="z">m</named-content>c',
      nested: '<named-content content-type="o">x' \
              '<named-content content-type="i">y</named-content>' \
              "z</named-content>",
      empty: '<named-content content-type="e"/>',
      target: 'a <target id="t1"/> b <target id="t2"/> c',
    }
  end

  nc_kinds = %i[named_content nested empty]

  cases.each do |mod, list|
    list.each do |class_name, element, with_nc, with_target|
      describe "#{mod}::#{class_name} (<#{element}>)" do
        let(:klass) { mod.const_get(class_name) }

        if with_nc
          nc_kinds.each do |kind|
            it "keeps #{kind.to_s.tr('_', '-')} content" do
              xml = "<#{element}>#{inputs[kind]}</#{element}>"
              expect(canonical(round_trip(klass, xml))).to eq(canonical(xml))
            end
          end
        end

        if with_target
          it "keeps repeated targets in document order" do
            xml = "<#{element}>#{inputs[:target]}</#{element}>"
            expect(canonical(round_trip(klass, xml))).to eq(canonical(xml))
          end
        end
      end
    end
  end

  describe "full documents" do
    # The skeleton below is deliberately minimal, so the XSD reports unrelated
    # errors about it; what must stay absent is any complaint about the
    # named-content elements themselves.
    let(:plain) { '<named-content content-type="k">n</named-content>' }

    def wrap(front_title, body)
      <<~XML
        <standard xmlns:xlink="http://www.w3.org/1999/xlink"><front><iso-meta><doc-ident><sdo>ISO</sdo><proj-id>1</proj-id><language>en</language><release-version>IS</release-version><urn>urn:x</urn></doc-ident></iso-meta></front><body><sec id="s"><title>#{front_title}</title>#{body}</sec></body></standard>
      XML
    end

    it "keeps named-content in an ISO sec title and table cells, XSD-clean" do
      xml = wrap(
        "T #{plain}",
        "<table-wrap id=\"tw\"><table><tbody><tr><th>h #{plain}</th>" \
        "<td>d #{plain}</td></tr></tbody></table></table-wrap>",
      )
      out = Sts::IsoSts::Standard.from_xml(xml).to_xml
      expect(out.scan("<named-content").size).to eq(3)
      errors = StsSchemas.errors(StsSchemas.isosts, out)
      expect(errors.grep(/named-content/)).to be_empty
    end

    it "keeps named-content in a NISO sec title" do
      xml = wrap("T #{plain}", "<p>x</p>")
      out = Sts::NisoSts::Standard.from_xml(xml).to_xml
      expect(out.scan("<named-content").size).to eq(1)
    end
  end
end
