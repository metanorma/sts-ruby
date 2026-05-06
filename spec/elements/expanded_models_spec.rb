# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Expanded element models" do
  describe Sts::NisoSts::SecMeta do
    it "round-trips sec-meta element" do
      xml = <<~XML
        <sec-meta id="sm1">
          <contrib-group>
            <contrib contrib-type="author">
              <name>
                <surname>Smith</surname>
              </name>
            </contrib>
          </contrib-group>
          <kwd-group kwd-group-type="test">
            <kwd>physics</kwd>
          </kwd-group>
        </sec-meta>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("sm1")
      expect(parsed.contrib_group.length).to eq(1)
      expect(parsed.kwd_group.length).to eq(1)
      expect(parsed.kwd_group.first.kwd_group_type).to eq("test")
    end
  end

  describe Sts::NisoSts::TermDisplayString do
    it "round-trips term-display-string element" do
      xml = <<~XML
        <term-display-string id="tds1">acceleration</term-display-string>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("tds1")
      expect(parsed.content.join).to include("acceleration")
    end
  end

  describe Sts::NisoSts::CompoundSubject do
    it "round-trips compound-subject with parts" do
      xml = <<~XML
        <compound-subject content-type="test" id="cs1">
          <compound-subject-part content-type="heading">
            <italic>Engineering</italic>
          </compound-subject-part>
          <compound-subject-part content-type="subheading">Design</compound-subject-part>
        </compound-subject>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("cs1")
      expect(parsed.content_type).to eq("test")
      expect(parsed.compound_subject_part.length).to eq(2)
      expect(parsed.compound_subject_part.first.content_type).to eq("heading")
    end
  end

  describe Sts::NisoSts::CompoundSubjectPart do
    it "round-trips with inline elements" do
      xml = <<~XML
        <compound-subject-part content-type="heading" id="csp1">
          <bold>Section</bold> 1
        </compound-subject-part>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("csp1")
      expect(parsed.content_type).to eq("heading")
      expect(parsed.bold.length).to eq(1)
    end
  end

  describe Sts::NisoSts::DisplayFormula do
    it "round-trips with caption and originator" do
      xml = <<~XML
        <disp-formula id="df1" content-type="test" originator="ISO" xml:lang="en">
          <label>Formula 1</label>
          <caption id="cap1">
            <title>Test formula</title>
          </caption>
          <math>content</math>
        </disp-formula>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("df1")
      expect(parsed.content_type).to eq("test")
      expect(parsed.originator).to eq("ISO")
      expect(parsed.xml_lang).to eq("en")
      expect(parsed.caption).not_to be_nil
      expect(parsed.caption.id).to eq("cap1")
    end

    it "round-trips with inline elements" do
      xml = <<~XML
        <disp-formula id="df2">
          <bold>Bold formula</bold>
          <italic>Italic part</italic>
        </disp-formula>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.bold.length).to eq(1)
      expect(parsed.italic.length).to eq(1)
    end
  end

  describe Sts::NisoSts::Source do
    it "round-trips with attributes and inline elements" do
      xml = <<~XML
        <source content-type="journal" id="src1" specific-use="test" xml:lang="en">
          <italic>Applied Physics</italic> Letters
        </source>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("src1")
      expect(parsed.content_type).to eq("journal")
      expect(parsed.specific_use).to eq("test")
      expect(parsed.xml_lang).to eq("en")
      expect(parsed.italic.length).to eq(1)
    end
  end

  describe Sts::NisoSts::InlineFormula do
    it "round-trips with alt-text and long-desc" do
      xml = <<~XML
        <inline-formula id="if1" content-type="test" xml:lang="en">
          <alt-text>formula 1</alt-text>
          <long-desc>A simple quadratic equation</long-desc>
          <math>x + 1</math>
        </inline-formula>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("if1")
      expect(parsed.content_type).to eq("test")
      expect(parsed.xml_lang).to eq("en")
      expect(parsed.alt_text).not_to be_nil
      expect(parsed.long_desc).not_to be_nil
    end
  end

  describe Sts::NisoSts::AwardGroup do
    it "round-trips with expanded attributes" do
      xml = <<~XML
        <award-group id="ag1" award-type="grant" rid="r1" specific-use="test">
          <funding-source>National Science Foundation</funding-source>
          <award-id>NSF-12345</award-id>
          <principal-award-recipient>
            <name><surname>Doe</surname></name>
          </principal-award-recipient>
          <principal-investigator>
            <name><surname>Smith</surname></name>
          </principal-investigator>
        </award-group>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("ag1")
      expect(parsed.award_type).to eq("grant")
      expect(parsed.rid).to eq("r1")
      expect(parsed.specific_use).to eq("test")
      expect(parsed.funding_source.length).to eq(1)
      expect(parsed.principal_award_recipient).not_to be_nil
      expect(parsed.principal_investigator).not_to be_nil
    end
  end

  describe Sts::NisoSts::DataTitle do
    it "round-trips with attributes and inline elements" do
      xml = <<~XML
        <data-title content-type="dataset" id="dt1" specific-use="primary" xml:lang="en">
          Dataset on <italic>climate change</italic> effects
        </data-title>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("dt1")
      expect(parsed.content_type).to eq("dataset")
      expect(parsed.xml_lang).to eq("en")
      expect(parsed.italic.length).to eq(1)
    end
  end

  describe Sts::NisoSts::StdDocMeta do
    it "round-trips with expanded attributes" do
      xml = <<~XML
        <std-doc-meta id="sdm1" std-meta-type="reg" std-org-type="iso" xml:lang="en">
          <title-wrap xml:lang="en">
            <full>ISO 9001</full>
          </title-wrap>
          <std-ident>
            <originator>ISO</originator>
            <doc-type>is</doc-type>
            <doc-number>9001</doc-number>
          </std-ident>
          <std-org>
            <std-org-name>ISO</std-org-name>
          </std-org>
          <content-language>en</content-language>
          <std-ref type="dated">ISO 9001:2015</std-ref>
          <secretariat>SAC</secretariat>
          <ics>03.120.10</ics>
        </std-doc-meta>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("sdm1")
      expect(parsed.std_meta_type).to eq("reg")
      expect(parsed.std_org_type).to eq("iso")
      expect(parsed.xml_lang).to eq("en")
      expect(parsed.title_wrap.length).to eq(1)
      expect(parsed.std_org.length).to eq(1)
      expect(parsed.content_language.length).to eq(1)
      expect(parsed.secretariat.length).to eq(1)
    end
  end

  describe Sts::NisoSts::IcsWrap do
    it "round-trips with vocab attributes" do
      xml = <<~XML
        <ics-wrap id="iw1" specific-use="test" vocab="ICS" vocab-identifier="http://example.org/ics">
          <ics>25.040.40</ics>
        </ics-wrap>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("iw1")
      expect(parsed.vocab).to eq("ICS")
      expect(parsed.vocab_identifier).to eq("http://example.org/ics")
    end
  end

  describe Sts::NisoSts::KwdGroup do
    it "round-trips with vocab attributes" do
      xml = <<~XML
        <kwd-group kwd-group-type="test" vocab="Thesaurus" vocab-identifier="http://example.org">
          <kwd>physics</kwd>
        </kwd-group>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.vocab).to eq("Thesaurus")
      expect(parsed.vocab_identifier).to eq("http://example.org")
    end
  end

  describe Sts::NisoSts::NamedContent do
    it "round-trips with all attributes" do
      xml = <<~XML
        <named-content content-type="test" id="nc1" rid="r1" vocab="V" vocab-identifier="http://v.org">
          <italic>Content</italic>
        </named-content>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("nc1")
      expect(parsed.rid).to eq("r1")
      expect(parsed.vocab).to eq("V")
      expect(parsed.vocab_identifier).to eq("http://v.org")
      expect(parsed.italic.length).to eq(1)
    end
  end

  describe Sts::NisoSts::Role do
    it "round-trips with vocab and inline elements" do
      xml = <<~XML
        <role id="rl1" content-type="author" vocab="ContributorRole" vocab-identifier="http://example.org/roles">
          <italic>Lead</italic> Author
        </role>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("rl1")
      expect(parsed.vocab).to eq("ContributorRole")
      expect(parsed.vocab_identifier).to eq("http://example.org/roles")
      expect(parsed.italic.length).to eq(1)
    end
  end

  describe Sts::NisoSts::SubjGroup do
    it "round-trips with compound-subject and recursive nesting" do
      xml = <<~XML
        <subj-group subj-group-type="test" vocab="Subjects" vocab-identifier="http://s.org">
          <subject>Engineering</subject>
          <compound-subject content-type="compound">
            <compound-subject-part content-type="h">A</compound-subject-part>
          </compound-subject>
          <subj-group subj-group-type="sub">
            <subject>Materials</subject>
          </subj-group>
        </subj-group>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.vocab).to eq("Subjects")
      expect(parsed.vocab_identifier).to eq("http://s.org")
      expect(parsed.compound_subject.length).to eq(1)
      expect(parsed.subj_group.length).to eq(1)
      expect(parsed.subj_group.first.subj_group_type).to eq("sub")
    end
  end

  describe Sts::NisoSts::Section do
    it "round-trips with sec-meta and xml:lang" do
      xml = <<~XML
        <sec id="s1" sec-type="scope" originator="ISO" xml:lang="en">
          <sec-meta id="sm1">
            <kwd-group kwd-group-type="scope">
              <kwd>testing</kwd>
            </kwd-group>
          </sec-meta>
          <title>Scope</title>
          <p>This standard covers testing methods.</p>
        </sec>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.xml_lang).to eq("en")
      expect(parsed.sec_meta).not_to be_nil
      expect(parsed.sec_meta.id).to eq("sm1")
      expect(parsed.sec_meta.kwd_group.length).to eq(1)
    end
  end
end
