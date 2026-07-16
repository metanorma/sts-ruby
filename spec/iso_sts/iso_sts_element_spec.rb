# frozen_string_literal: true

RSpec.describe Sts::IsoSts do
  describe "Standard" do
    it "can be instantiated" do
      standard = described_class::Standard.new
      expect(standard).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Front" do
    it "can be instantiated" do
      front = described_class::Front.new
      expect(front).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Body" do
    it "can be instantiated" do
      body = described_class::Body.new
      expect(body).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Back" do
    it "can be instantiated" do
      back = described_class::Back.new
      expect(back).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "IsoMeta" do
    it "can be instantiated" do
      iso_meta = described_class::IsoMeta.new
      expect(iso_meta).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "RegMeta" do
    it "can be instantiated" do
      reg_meta = described_class::RegMeta.new
      expect(reg_meta).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "NatMeta" do
    it "can be instantiated" do
      nat_meta = described_class::NatMeta.new
      expect(nat_meta).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "TitleWrap" do
    it "can be instantiated" do
      title_wrap = described_class::TitleWrap.new
      expect(title_wrap).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "TitleMain" do
    it "can be instantiated" do
      title_main = described_class::TitleMain.new
      expect(title_main).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "DocumentIdentification" do
    it "can be instantiated" do
      doc_ident = described_class::DocumentIdentification.new
      expect(doc_ident).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "StandardIdentification" do
    it "can be instantiated" do
      std_ident = described_class::StandardIdentification.new
      expect(std_ident).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Permissions" do
    it "can be instantiated" do
      permissions = described_class::Permissions.new
      expect(permissions).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "PageCount" do
    it "can be instantiated" do
      page_count = described_class::PageCount.new
      expect(page_count).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Sec" do
    it "can be instantiated" do
      sec = described_class::Sec.new
      expect(sec).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "TermSec" do
    it "can be instantiated" do
      term_sec = described_class::TermSec.new
      expect(term_sec).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "NonNormativeNote" do
    it "can be instantiated" do
      note = described_class::NonNormativeNote.new
      expect(note).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "NonNormativeExample" do
    it "can be instantiated" do
      example = described_class::NonNormativeExample.new
      expect(example).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Paragraph" do
    it "can be instantiated" do
      paragraph = described_class::Paragraph.new
      expect(paragraph).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "InlineFormula" do
    it "can be instantiated" do
      inline_formula = described_class::InlineFormula.new
      expect(inline_formula).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "DispFormula" do
    it "can be instantiated" do
      disp_formula = described_class::DispFormula.new
      expect(disp_formula).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Std" do
    it "can be instantiated" do
      std = described_class::Std.new
      expect(std).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "StdRef" do
    it "can be instantiated" do
      std_ref = described_class::StdRef.new
      expect(std_ref).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "StyledContent" do
    it "can be instantiated" do
      styled_content = described_class::StyledContent.new
      expect(styled_content).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Preformat" do
    it "can be instantiated" do
      preformat = described_class::Preformat.new
      expect(preformat).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Xref" do
    it "can be instantiated" do
      xref = described_class::Xref.new
      expect(xref).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "ExtLink" do
    it "can be instantiated" do
      ext_link = described_class::ExtLink.new
      expect(ext_link).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Break" do
    it "can be instantiated" do
      brk = described_class::Break.new
      expect(brk).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Sub" do
    it "can be instantiated" do
      sub = described_class::Sub.new
      expect(sub).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Sup" do
    it "can be instantiated" do
      sup = described_class::Sup.new
      expect(sup).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Label" do
    it "can be instantiated" do
      label = described_class::Label.new
      expect(label).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Title" do
    it "can be instantiated" do
      title = described_class::Title.new
      expect(title).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "List" do
    it "can be instantiated" do
      list = described_class::List.new
      expect(list).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "ListItem" do
    it "can be instantiated" do
      list_item = described_class::ListItem.new
      expect(list_item).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "DefList" do
    it "can be instantiated" do
      def_list = described_class::DefList.new
      expect(def_list).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "DefItem" do
    it "can be instantiated" do
      def_item = described_class::DefItem.new
      expect(def_item).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Term" do
    it "can be instantiated" do
      term = described_class::Term.new
      expect(term).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Def" do
    it "can be instantiated" do
      defn = described_class::Def.new
      expect(defn).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "TableWrap" do
    it "can be instantiated" do
      table_wrap = described_class::TableWrap.new
      expect(table_wrap).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Table" do
    it "can be instantiated" do
      table = described_class::Table.new
      expect(table).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Thead" do
    it "can be instantiated" do
      thead = described_class::Thead.new
      expect(thead).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Tbody" do
    it "can be instantiated" do
      tbody = described_class::Tbody.new
      expect(tbody).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Tfoot" do
    it "can be instantiated" do
      tfoot = described_class::Tfoot.new
      expect(tfoot).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Tr" do
    it "can be instantiated" do
      tr = described_class::Tr.new
      expect(tr).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Th" do
    it "can be instantiated" do
      th = described_class::Th.new
      expect(th).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Td" do
    it "can be instantiated" do
      td = described_class::Td.new
      expect(td).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Col" do
    it "can be instantiated" do
      col = described_class::Col.new
      expect(col).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Colgroup" do
    it "can be instantiated" do
      colgroup = described_class::Colgroup.new
      expect(colgroup).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Caption" do
    it "can be instantiated" do
      caption = described_class::Caption.new
      expect(caption).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "TableWrapFoot" do
    it "can be instantiated" do
      table_wrap_foot = described_class::TableWrapFoot.new
      expect(table_wrap_foot).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Array" do
    it "can be instantiated" do
      array = described_class::Array.new
      expect(array).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Fig" do
    it "can be instantiated" do
      fig = described_class::Fig.new
      expect(fig).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Graphic" do
    it "can be instantiated" do
      graphic = described_class::Graphic.new
      expect(graphic).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "RefList" do
    it "can be instantiated" do
      ref_list = described_class::RefList.new
      expect(ref_list).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Ref" do
    it "can be instantiated" do
      ref = described_class::Ref.new
      expect(ref).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "MixedCitation" do
    it "can be instantiated" do
      mixed_citation = described_class::MixedCitation.new
      expect(mixed_citation).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "AppGroup" do
    it "can be instantiated" do
      app_group = described_class::AppGroup.new
      expect(app_group).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "App" do
    it "can be instantiated" do
      app = described_class::App.new
      expect(app).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "AnnexType" do
    it "can be instantiated" do
      annex_type = described_class::AnnexType.new
      expect(annex_type).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "FnGroup" do
    it "can be instantiated" do
      fn_group = described_class::FnGroup.new
      expect(fn_group).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Fn" do
    it "can be instantiated" do
      fn = described_class::Fn.new
      expect(fn).to be_a(Lutaml::Model::Serializable)
    end
  end

  describe "Mathml2::Math" do
    it "can be instantiated" do
      math = described_class::Mathml2::Math.new
      expect(math).to be_a(Lutaml::Model::Serializable)
    end
  end

  # ISOSTS declares these elements as type="xs:string": text content, no
  # attributes. They are modelled as IsoSts classes rather than plain strings
  # because an empty element (<sdo/>) does not survive a :string round-trip --
  # for a collection it parses to [], losing the element entirely.
  describe "ISOSTS xs:string elements" do
    {
      Originator: "originator",
      DocType: "doc-type",
      DocNumber: "doc-number",
      PartNumber: "part-number",
      Version: "version",
      SupplType: "suppl-type",
      SupplNumber: "suppl-number",
      SupplVersion: "suppl-version",
      Urn: "urn",
      Sdo: "sdo",
      ProjId: "proj-id",
      ReleaseVersion: "release-version",
      Ics: "ics",
      Secretariat: "secretariat",
    }.each do |klass, element|
      it "IsoSts::#{klass} maps <#{element}>" do
        model = described_class.const_get(klass)
        expect(model.mappings_for(:xml).root_element).to eq(element)
      end

      it "IsoSts::#{klass} has only content, as ISOSTS defines no attributes" do
        model = described_class.const_get(klass)
        expect(model.attributes.keys).to eq(%i[content])
      end

      it "IsoSts::#{klass} round-trips an empty <#{element}/>" do
        model = described_class.const_get(klass)
        xml = "<#{element}/>"
        expect(model.to_xml(model.from_xml(xml)).strip).to eq(xml)
      end
    end
  end

  describe "IsoSts models that reference the xs:string element classes" do
    {
      "StandardIdentification" => {
        originator: :Originator, doc_type: :DocType, doc_number: :DocNumber,
        part_number: :PartNumber, version: :Version, suppl_type: :SupplType,
        suppl_number: :SupplNumber, suppl_version: :SupplVersion
      },
      "StdRef" => {
        originator: :Originator, doc_type: :DocType, doc_number: :DocNumber,
        part_number: :PartNumber, suppl_type: :SupplType,
        suppl_number: :SupplNumber
      },
      "DocumentIdentification" => {
        sdo: :Sdo, proj_id: :ProjId, release_version: :ReleaseVersion,
        urn: :Urn
      },
      "RegMeta" => { secretariat: :Secretariat, ics: :Ics },
      "NatMeta" => { secretariat: :Secretariat, ics: :Ics },
      "IsoMeta" => { secretariat: :Secretariat, ics: :Ics },
    }.each do |model_name, expectations|
      expectations.each do |attr, klass|
        it "#{model_name}##{attr} uses IsoSts::#{klass}" do
          model = described_class.const_get(model_name)
          expect(model.attributes[attr].type)
            .to eq(described_class.const_get(klass))
        end
      end
    end
  end

  # ISOSTS <permissions> is copyright-statement*, copyright-year*,
  # copyright-holder*, license* -- exactly what IsoSts::Permissions models.
  describe "permissions uses the IsoSts model" do
    %w[Array App TableWrapFoot].each do |model_name|
      it "#{model_name}#permissions is IsoSts::Permissions" do
        model = described_class.const_get(model_name)
        expect(model.attributes[:permissions].type)
          .to eq(described_class::Permissions)
      end
    end
  end

  # ISOSTS defines no <ruby> element; only NISO STS does.
  describe "styled-content matches the ISOSTS content model" do
    it "does not model <ruby>, which ISOSTS does not define" do
      expect(described_class::StyledContent.attributes).not_to have_key(:ruby)
    end
  end

  # ISOSTS gives <wi-number> an @id; modelling it as a plain string dropped it.
  describe "IsoSts::WiNumber" do
    it "models the @id that ISOSTS defines" do
      expect(described_class::WiNumber.attributes.keys)
        .to match_array(%i[content id])
    end

    it "preserves @id through a round-trip" do
      xml = '<wi-number id="wi-1">12345</wi-number>'
      parsed = described_class::WiNumber.from_xml(xml)
      expect(parsed.id).to eq("wi-1")
      expect(described_class::WiNumber.to_xml(parsed).strip).to eq(xml)
    end

    it "is used by RegMeta rather than a plain string" do
      expect(described_class::RegMeta.attributes[:wi_number].type)
        .to eq(described_class::WiNumber)
    end
  end
end
