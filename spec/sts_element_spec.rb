# frozen_string_literal: true

RSpec.describe Sts::NisoSts do
  describe "Element Classes" do
    it "loads all autoloaded constants" do
      expect { Sts::NisoSts::Contrib }.not_to raise_error
      expect { Sts::NisoSts::ContribGroup }.not_to raise_error
      expect { Sts::NisoSts::Name }.not_to raise_error
      expect { Sts::NisoSts::Aff }.not_to raise_error
      expect { Sts::NisoSts::ElementCitation }.not_to raise_error
      expect { Sts::NisoSts::NlmCitation }.not_to raise_error
      expect { Sts::NisoSts::MixedCitation }.not_to raise_error
    end

    it "creates instance of Contrib" do
      contrib = Sts::NisoSts::Contrib.new
      expect(contrib).to be_a(Sts::NisoSts::Contrib)
    end

    it "creates instance of ElementCitation" do
      citation = Sts::NisoSts::ElementCitation.new
      expect(citation).to be_a(Sts::NisoSts::ElementCitation)
    end

    it "creates instance of Name" do
      name = Sts::NisoSts::Name.new
      expect(name).to be_a(Sts::NisoSts::Name)
    end

    it "creates instance of Aff" do
      aff = Sts::NisoSts::Aff.new
      expect(aff).to be_a(Sts::NisoSts::Aff)
    end

    it "creates instance of PersonGroup" do
      person_group = Sts::NisoSts::PersonGroup.new
      expect(person_group).to be_a(Sts::NisoSts::PersonGroup)
    end
  end

  describe "XML Serialization" do
    it "serializes Contrib to xml" do
      contrib = Sts::NisoSts::Contrib.new
      xml = contrib.to_xml
      expect(xml).to include("<contrib")
    end

    it "serializes Name to xml" do
      name = Sts::NisoSts::Name.new
      xml = name.to_xml
      expect(xml).to include("<name")
    end

    it "serializes Aff to xml" do
      aff = Sts::NisoSts::Aff.new
      xml = aff.to_xml
      expect(xml).to include("<aff")
    end

    it "parses Contrib from xml" do
      xml = "<contrib contrib-type=\"author\">" \
            "<name><surname>Smith</surname></name></contrib>"
      contrib = Sts::NisoSts::Contrib.from_xml(xml)
      expect(contrib.contrib_type).to eq("author")
      expect(contrib.name).to be_a(Sts::NisoSts::Name)
    end

    it "parses ElementCitation from xml" do
      xml = '<element-citation publication-type="journal">' \
            "<source>J Test</source></element-citation>"
      citation = Sts::NisoSts::ElementCitation.from_xml(xml)
      expect(citation.publication_type).to eq("journal")
      expect(citation.source.content).to eq("J Test")
    end

    it "round-trips Contrib through xml" do
      contrib = Sts::NisoSts::Contrib.new
      xml = contrib.to_xml
      parsed = Sts::NisoSts::Contrib.from_xml(xml)
      expect(parsed).to be_a(Sts::NisoSts::Contrib)
    end

    it "round-trips ElementCitation through xml" do
      citation = Sts::NisoSts::ElementCitation.new
      xml = citation.to_xml
      parsed = Sts::NisoSts::ElementCitation.from_xml(xml)
      expect(parsed).to be_a(Sts::NisoSts::ElementCitation)
    end
  end

  describe "Emphasis Elements" do
    it "creates Monospace element" do
      mono = Sts::NisoSts::Monospace.new
      expect(mono).to be_a(Sts::NisoSts::Monospace)
    end

    it "creates Ruby element with rb and rt" do
      ruby = Sts::NisoSts::Ruby.new
      ruby.rb = Sts::NisoSts::Rb.new
      ruby.rt = Sts::NisoSts::Rt.new
      expect(ruby.rb).to be_a(Sts::NisoSts::Rb)
      expect(ruby.rt).to be_a(Sts::NisoSts::Rt)
    end

    it "serializes Sub element to xml" do
      sub = Sts::NisoSts::Sub.new
      xml = sub.to_xml
      expect(xml).to include("<sub")
    end

    it "serializes Sup element to xml" do
      sup = Sts::NisoSts::Sup.new
      xml = sup.to_xml
      expect(xml).to include("<sup")
    end
  end

  describe "Xi Module" do
    it "loads Xi::Include" do
      expect { Sts::NisoSts::Xi::Include }.not_to raise_error
    end

    it "loads Xi::Fallback" do
      expect { Sts::NisoSts::Xi::Fallback }.not_to raise_error
    end

    it "creates Xi::Include instance" do
      include_elem = Sts::NisoSts::Xi::Include.new
      expect(include_elem).to be_a(Sts::NisoSts::Xi::Include)
    end

    it "creates Xi::Fallback instance" do
      fallback = Sts::NisoSts::Xi::Fallback.new
      expect(fallback).to be_a(Sts::NisoSts::Xi::Fallback)
    end

    it "serializes Xi::Include with href attribute" do
      include_elem = Sts::NisoSts::Xi::Include.new
      include_elem.href = "http://example.com"
      xml = include_elem.to_xml
      expect(xml).to include('href="http://example.com"')
    end
  end

  describe "Ali Module" do
    it "loads Ali::FreeToRead" do
      expect { Sts::NisoSts::Ali::FreeToRead }.not_to raise_error
    end

    it "loads Ali::LicenseRef" do
      expect { Sts::NisoSts::Ali::LicenseRef }.not_to raise_error
    end

    it "creates Ali::FreeToRead instance" do
      ftr = Sts::NisoSts::Ali::FreeToRead.new
      expect(ftr).to be_a(Sts::NisoSts::Ali::FreeToRead)
    end

    it "creates Ali::LicenseRef instance" do
      license = Sts::NisoSts::Ali::LicenseRef.new
      expect(license).to be_a(Sts::NisoSts::Ali::LicenseRef)
    end

    it "serializes Ali::FreeToRead with attributes" do
      ftr = Sts::NisoSts::Ali::FreeToRead.new
      ftr.start_date = "2024-01-01"
      xml = ftr.to_xml
      expect(xml).to include('start_date="2024-01-01"')
    end
  end
end