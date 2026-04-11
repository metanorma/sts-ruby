# frozen_string_literal: true

RSpec.describe Sts::TbxIsoTml do
  describe "Table" do
    it "can be instantiated" do
      table = described_class::Table.new
      expect(table).to be_a(Lutaml::Model::Serializable)
    end

    it "supports tfoot element" do
      table = described_class::Table.new
      table.tfoot = described_class::Tfoot.new
      expect(table.tfoot).to be_a(described_class::Tfoot)
    end

    it "supports colgroup element" do
      table = described_class::Table.new
      table.colgroup = [described_class::Colgroup.new]
      expect(table.colgroup.size).to eq(1)
    end

    it "supports tr element directly" do
      table = described_class::Table.new
      table.tr = [described_class::Tr.new]
      expect(table.tr.size).to eq(1)
    end
  end

  describe "TableWrap" do
    it "can be instantiated" do
      table_wrap = described_class::TableWrap.new
      expect(table_wrap).to be_a(Lutaml::Model::Serializable)
    end

    it "supports specific_use attribute" do
      table_wrap = described_class::TableWrap.new
      table_wrap.specific_use = "test"
      expect(table_wrap.specific_use).to eq("test")
    end

    it "supports xml_lang attribute" do
      table_wrap = described_class::TableWrap.new
      table_wrap.xml_lang = "en"
      expect(table_wrap.xml_lang).to eq("en")
    end

    it "supports content_type attribute" do
      table_wrap = described_class::TableWrap.new
      table_wrap.content_type = "table"
      expect(table_wrap.content_type).to eq("table")
    end

    it "supports originator attribute" do
      table_wrap = described_class::TableWrap.new
      table_wrap.originator = "test-origin"
      expect(table_wrap.originator).to eq("test-origin")
    end
  end

  describe "Th" do
    it "can be instantiated" do
      th = described_class::Th.new
      expect(th).to be_a(Lutaml::Model::Serializable)
    end

    it "supports abbr attribute" do
      th = described_class::Th.new
      th.abbr = "th-abbr"
      expect(th.abbr).to eq("th-abbr")
    end

    it "supports axis attribute" do
      th = described_class::Th.new
      th.axis = "col"
      expect(th.axis).to eq("col")
    end

    it "supports headers attribute" do
      th = described_class::Th.new
      th.headers = "header1"
      expect(th.headers).to eq("header1")
    end

    it "supports id attribute" do
      th = described_class::Th.new
      th.id = "th-1"
      expect(th.id).to eq("th-1")
    end

    it "supports paragraph element" do
      th = described_class::Th.new
      th.paragraph = Sts::NisoSts::Paragraph.new
      expect(th.paragraph).to be_a(Sts::NisoSts::Paragraph)
    end

    it "supports fn element" do
      th = described_class::Th.new
      th.fn = described_class::Fn.new
      expect(th.fn).to be_a(described_class::Fn)
    end
  end

  describe "Td" do
    it "can be instantiated" do
      td = described_class::Td.new
      expect(td).to be_a(Lutaml::Model::Serializable)
    end

    it "supports abbr attribute" do
      td = described_class::Td.new
      td.abbr = "td-abbr"
      expect(td.abbr).to eq("td-abbr")
    end

    it "supports axis attribute" do
      td = described_class::Td.new
      td.axis = "row"
      expect(td.axis).to eq("row")
    end

    it "supports headers attribute" do
      td = described_class::Td.new
      td.headers = "header1"
      expect(td.headers).to eq("header1")
    end

    it "supports id attribute" do
      td = described_class::Td.new
      td.id = "td-1"
      expect(td.id).to eq("td-1")
    end

    it "supports fn element" do
      td = described_class::Td.new
      td.fn = described_class::Fn.new
      expect(td.fn).to be_a(described_class::Fn)
    end
  end

  describe "TableWrapFoot" do
    it "can be instantiated" do
      table_wrap_foot = described_class::TableWrapFoot.new
      expect(table_wrap_foot).to be_a(Lutaml::Model::Serializable)
    end

    it "supports attrib element" do
      table_wrap_foot = described_class::TableWrapFoot.new
      table_wrap_foot.attrib = Sts::NisoSts::Attrib.new
      expect(table_wrap_foot.attrib).to be_a(Sts::NisoSts::Attrib)
    end

    it "supports permissions element" do
      table_wrap_foot = described_class::TableWrapFoot.new
      table_wrap_foot.permissions = Sts::NisoSts::Permissions.new
      expect(table_wrap_foot.permissions).to be_a(Sts::NisoSts::Permissions)
    end

    it "supports paragraph element" do
      table_wrap_foot = described_class::TableWrapFoot.new
      table_wrap_foot.paragraph = Sts::NisoSts::Paragraph.new
      expect(table_wrap_foot.paragraph).to be_a(Sts::NisoSts::Paragraph)
    end

    it "supports non_normative_note element" do
      table_wrap_foot = described_class::TableWrapFoot.new
      table_wrap_foot.non_normative_note = Sts::NisoSts::NonNormativeNote.new
      expect(table_wrap_foot.non_normative_note).to be_a(Sts::NisoSts::NonNormativeNote)
    end

    it "supports non_normative_example element" do
      table_wrap_foot = described_class::TableWrapFoot.new
      table_wrap_foot.non_normative_example = Sts::NisoSts::NonNormativeExample.new
      expect(table_wrap_foot.non_normative_example).to be_a(Sts::NisoSts::NonNormativeExample)
    end

    it "supports fn element" do
      table_wrap_foot = described_class::TableWrapFoot.new
      table_wrap_foot.fn = described_class::Fn.new
      expect(table_wrap_foot.fn).to be_a(described_class::Fn)
    end
  end

  describe "Tfoot" do
    it "can be instantiated" do
      tfoot = described_class::Tfoot.new
      expect(tfoot).to be_a(Lutaml::Model::Serializable)
    end

    it "supports tr collection" do
      tfoot = described_class::Tfoot.new
      tfoot.tr = [described_class::Tr.new]
      expect(tfoot.tr.size).to eq(1)
    end

    it "supports content_type attribute" do
      tfoot = described_class::Tfoot.new
      tfoot.content_type = "footer"
      expect(tfoot.content_type).to eq("footer")
    end
  end

  describe "Colgroup" do
    it "can be instantiated" do
      colgroup = described_class::Colgroup.new
      expect(colgroup).to be_a(Lutaml::Model::Serializable)
    end

    it "supports col collection" do
      colgroup = described_class::Colgroup.new
      colgroup.col = [described_class::Col.new]
      expect(colgroup.col.size).to eq(1)
    end

    it "supports span attribute" do
      colgroup = described_class::Colgroup.new
      colgroup.span = "2"
      expect(colgroup.span).to eq("2")
    end
  end
end
