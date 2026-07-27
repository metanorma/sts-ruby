# frozen_string_literal: true

RSpec.describe Sts::IsoSts do
  let(:registry_source) do
    File.read(File.join(repository_root, "lib/sts/iso_sts.rb"))
  end
  let(:xsd) do
    Nokogiri::XML(
      File.read(
        File.join(
          repository_root,
          "reference-docs/isosts-v1/xsd/ISOSTS.xsd",
        ),
      ),
    )
  end
  let(:recursive_registry) do
    registry_source
      .split("    # Recursive content closure\n", 2)
      .fetch(1)
      .split("\n    # List elements", 2)
      .first
      .scan(%r{autoload :(\w+),\s+"[^"]+/iso_sts/([^"]+)"}m)
      .to_h
  end
  let(:element_classes) do
    full_registry = registry_source
      .scan(%r{autoload :(\w+),\s+"[^"]+/iso_sts/([^"]+)"}m)
      .to_h
    full_registry.each_key.with_object({}) do |class_name, result|
      model = described_class.const_get(class_name, false)
      next unless model.respond_to?(:mappings_for)

      element = model.mappings_for(:xml).root_element
      result[element] ||= model if element
    end
  end

  def repository_root
    File.expand_path("../..", __dir__)
  end

  def xsd_namespaces
    { "xs" => "http://www.w3.org/2001/XMLSchema" }
  end

  def ruby_xml_attribute(xml_name)
    return "object_id_value" if xml_name == "object-id"

    xml_name.tr(":-", "__")
  end

  def base_child_name(xml_name)
    {
      "p" => "paragraph",
      "mml:math" => "math",
      "tbx:entailedTerm" => "entailed_term",
      "object-id" => "sts_object_id",
    }.fetch(xml_name, xml_name.tr(":-", "__"))
  end

  def collection?(element_node, complex_type)
    current = element_node
    until current == complex_type
      max_occurs = current["maxOccurs"]
      return true if max_occurs && max_occurs != "1"

      current = current.parent
    end
    false
  end

  def child_type(reference)
    return Mml::V2::Math if reference == "mml:math"
    return Sts::IsoSts::StdRef if reference == "std-ref"
    if reference == "tbx:entailedTerm"
      return Sts::TbxIsoTml::EntailedTerm
    end

    element_classes.fetch(reference)
  end

  def xml_attributes_for(complex_type)
    attributes = complex_type.xpath(
      "./xs:attribute",
      xsd_namespaces,
    ).map { |attribute| attribute["name"] || attribute["ref"] }
    ["id", *attributes.reject { |name| name == "id" }]
  end

  def expected_child(reference, occurrences, complex_type, ruby_attributes)
    name = base_child_name(reference)
    name = "#{name}_element" if ruby_attributes.include?(name)
    {
      name: name,
      type: child_type(reference),
      collection: occurrences.any? do |child|
        collection?(child, complex_type)
      end,
    }
  end

  def expected_children_for(complex_type, ruby_attributes)
    children = complex_type.xpath(".//xs:element[@ref]", xsd_namespaces)
    children.group_by { |child| child["ref"] }
      .to_h do |reference, occurrences|
      child = expected_child(
        reference,
        occurrences,
        complex_type,
        ruby_attributes,
      )
      [reference, child]
    end
  end

  def simple_schema
    {
      xml_attributes: ["id"],
      ruby_attributes: %w[id content],
      children: {},
      mixed: false,
      content: true,
    }
  end

  def complex_schema(complex_type)
    xml_attributes = xml_attributes_for(complex_type)
    ruby_attributes = xml_attributes.map { |name| ruby_xml_attribute(name) }
    mixed = complex_type["mixed"] == "true"
    ruby_attributes << "content" if mixed
    {
      xml_attributes: xml_attributes,
      ruby_attributes: ruby_attributes,
      children: expected_children_for(complex_type, ruby_attributes),
      mixed: mixed,
      content: mixed,
    }
  end

  def expected_schema(node)
    complex_type = node.at_xpath("./xs:complexType", xsd_namespaces)
    complex_type ? complex_schema(complex_type) : simple_schema
  end

  def xml_attribute_value(name, index)
    {
      "id" => "closure-#{index}",
      "xml:lang" => "en",
      "xlink:type" => "simple",
      "xlink:href" => "https://example.com/#{index}",
      "xlink:show" => "replace",
      "xlink:actuate" => "onRequest",
      "continued-from" => "closure-source",
      "rid" => "closure-target",
    }.fetch(name, "value-#{index}")
  end

  def element_xml(element, attributes: {}, content: "")
    namespaces = [
      'xmlns:xlink="http://www.w3.org/1999/xlink"',
      'xmlns:mml="http://www.w3.org/1998/Math/MathML"',
      'xmlns:tbx="urn:iso:std:iso:30042:ed-1"',
    ]
    mapped = attributes.map { |name, value| %(#{name}="#{value}") }
    "<#{element} #{[*namespaces, *mapped].join(' ')}>#{content}</#{element}>"
  end

  def mapped_child(instance, child)
    value = instance.public_send(child[:name])
    child[:collection] ? value.first : value
  end

  def mapped_element_names(children)
    children.keys.map { |reference| reference.split(":").last }
  end

  it "registers all 90 closure models one-to-one with their files" do
    expect(recursive_registry.size).to eq(90)

    recursive_registry.each do |class_name, relative_path|
      expect(described_class.const_defined?(class_name, false)).to be(true)
      expect(File).to exist(
        File.join(
          repository_root,
          "lib/sts/iso_sts/#{relative_path}.rb",
        ),
      )
    end
  end

  it "models the complete XSD surface and mandatory id" do
    recursive_registry.each do |class_name, relative_path|
      model = described_class.const_get(class_name, false)
      mapping = model.mappings_for(:xml)
      element = mapping.root_element
      node = xsd.at_xpath(
        "/xs:schema/xs:element[@name='#{element}']",
        xsd_namespaces,
      )
      expected = expected_schema(node)

      aggregate_failures(class_name) do
        expected_keys = expected[:ruby_attributes].map(&:to_sym) +
          expected[:children].values.map { |child| child[:name].to_sym }
        expect(model.attributes.keys).to match_array(expected_keys)
        expect(mapping.attributes.map(&:name))
          .to match_array(expected[:xml_attributes])
        expect(mapping.elements.map(&:name))
          .to match_array(mapped_element_names(expected[:children]))
        expect(mapping.mixed_content?).to eq(expected[:mixed])
        expect(!!mapping.ordered?)
          .to eq(expected[:mixed] || expected[:children].any?)
        expect(mapping.content_mapping.nil?).to eq(!expected[:content])

        expected[:children].each_value do |child|
          attribute = model.attributes.fetch(child[:name].to_sym)
          expect(attribute.type).to eq(child[:type])
          expect(attribute.collection?).to eq(child[:collection])
        end

        parsed = model.from_xml(%(<#{element} id="closure-1"/>))
        expect(parsed.id).to eq("closure-1")
        expect(model.to_xml(parsed)).to include('id="closure-1"')

        source = File.read(
          File.join(
            repository_root,
            "lib/sts/iso_sts/#{relative_path}.rb",
          ),
        )
        expect(source).not_to include("Sts::NisoSts::")
        expect(source).not_to include("required: true")
      end
    end
  end

  it "round-trips every XML attribute on every closure model" do
    recursive_registry.each_with_index do |(class_name, _relative_path), index|
      model = described_class.const_get(class_name, false)
      mapping = model.mappings_for(:xml)
      node = xsd.at_xpath(
        "/xs:schema/xs:element[@name='#{mapping.root_element}']",
        xsd_namespaces,
      )
      expected = expected_schema(node)
      values = expected[:xml_attributes].to_h do |name|
        [name, xml_attribute_value(name, index)]
      end
      reparsed = model.from_xml(
        model.to_xml(
          model.from_xml(element_xml(mapping.root_element, attributes: values)),
        ),
      )

      aggregate_failures(class_name) do
        expected[:xml_attributes]
          .zip(expected[:ruby_attributes])
          .each do |xml_name, ruby_name|
          expect(reparsed.public_send(ruby_name))
            .to eq(values.fetch(xml_name))
        end
      end
    end
  end

  it "round-trips text content and every child on every closure model" do
    recursive_registry.each_key do |class_name|
      model = described_class.const_get(class_name, false)
      mapping = model.mappings_for(:xml)
      node = xsd.at_xpath(
        "/xs:schema/xs:element[@name='#{mapping.root_element}']",
        xsd_namespaces,
      )
      expected = expected_schema(node)

      if expected[:content]
        xml = element_xml(
          mapping.root_element,
          attributes: { "id" => "content-1" },
          content: "round-trip text",
        )
        reparsed = model.from_xml(model.to_xml(model.from_xml(xml)))
        expect(Array(reparsed.content).join).to include("round-trip text")
      end

      expected[:children].each do |reference, child|
        xml = element_xml(
          mapping.root_element,
          attributes: { "id" => "parent-1" },
          content: "<#{reference}/>",
        )
        serialized = model.to_xml(model.from_xml(xml))
        reparsed = model.from_xml(serialized)

        aggregate_failures("#{class_name}##{child[:name]}") do
          expect(mapped_child(reparsed, child)).not_to be_nil
          names = Nokogiri::XML(serialized).root.element_children.map(&:name)
          expect(names).to include(reference.split(":").last)
        end
      end
    end
  end

  it "removes every Niso type from IsoSts" do
    expect(Sts::IsoSts::Array.attributes[:attrib].type)
      .to eq(Sts::IsoSts::Attrib)
    expect(Sts::IsoSts::Body.attributes[:disp_quote].type)
      .to eq(Sts::IsoSts::DispQuote)
    expect(Sts::IsoSts::Sec.attributes[:disp_quote].type)
      .to eq(Sts::IsoSts::DispQuote)
    expect(Sts::IsoSts::Sec.attributes[:boxed_text].type)
      .to eq(Sts::IsoSts::BoxedText)
    expect(Sts::IsoSts::Ref.attributes[:element_citation].type)
      .to eq(Sts::IsoSts::ElementCitation)
    expect(Sts::IsoSts::TableWrapFoot.attributes[:attrib].type)
      .to eq(Sts::IsoSts::Attrib)
    expect(Sts::IsoSts::DefList.attributes[:term_head].type)
      .to eq(Sts::IsoSts::TermHead)
    expect(Sts::IsoSts::Permissions.attributes[:license].type)
      .to eq(Sts::IsoSts::License)
    expect(Sts::IsoSts::TermSec.attributes[:term_display].type)
      .to eq(Sts::IsoSts::TermDisplay)

    {
      person_group: Sts::IsoSts::PersonGroup,
      collab: Sts::IsoSts::Collab,
      source: Sts::IsoSts::Source,
      article_title: Sts::IsoSts::ArticleTitle,
    }.each do |attribute, type|
      expect(Sts::IsoSts::MixedCitation.attributes[attribute].type)
        .to eq(type)
    end

    {
      iso_meta: Sts::IsoSts::IsoMeta,
      nat_meta: Sts::IsoSts::NatMeta,
      reg_meta: Sts::IsoSts::RegMeta,
    }.each_value do |model|
      expect(model.attributes[:custom_meta_group].type)
        .to eq(Sts::IsoSts::CustomMetaGroup)
    end

    source = Dir[File.join(repository_root, "lib/sts/iso_sts/**/*.rb")]
      .map { |path| File.read(path) }
      .join
    expect(source).not_to include("Sts::NisoSts::")
  end

  it "round-trips a nested recursive citation closure" do
    xml = <<~XML
      <disp-quote id="dq1" content-type="quotation" xml:lang="en">
        <label id="l1">Quote</label>
        <title id="t1">Recursive closure</title>
        <boxed-text id="b1">
          <disp-quote id="dq2">
            <p id="p1">Nested quote</p>
            <attrib id="a1">
              <element-citation id="c1" publication-type="standard">
                <person-group id="pg1" person-group-type="author">
                  <name id="n1" name-style="western">
                    <surname id="s1">Doe</surname>
                    <given-names id="g1">Jane</given-names>
                  </name>
                </person-group>
                <article-title id="at1">Title</article-title>
                <source id="so1">Journal</source>
              </element-citation>
            </attrib>
          </disp-quote>
        </boxed-text>
        <attrib id="a2">Attribution</attrib>
      </disp-quote>
    XML

    parsed = Sts::IsoSts::DispQuote.from_xml(xml)
    expect(Sts::IsoSts::DispQuote.to_xml(parsed))
      .to be_xml_equivalent_to(xml)
  end

  it "round-trips the final bounded closures" do
    custom_meta = <<~XML
      <custom-meta-group id="cmg1">
        <custom-meta id="cm1">
          <meta-name id="mn1">key</meta-name>
          <meta-value id="mv1">value</meta-value>
        </custom-meta>
      </custom-meta-group>
    XML
    license = <<~XML
      <license id="l1" license-type="open">
        <license-p id="lp1">Terms
          <funding-source id="fs1">Agency</funding-source>
          <award-id id="ai1">A-1</award-id>
          <price id="pr1">$5</price>
          <open-access id="oa1"><p id="p1">Open</p></open-access>
        </license-p>
      </license>
    XML
    term_display = <<~XML
      <term-display id="td1" xml:lang="en">
        <title id="t1">Term</title>
        <p id="p1">Definition</p>
      </term-display>
    XML
    term_head = <<~XML
      <term-head id="th1">Terms <bold id="b1">header</bold></term-head>
    XML
    examples = {
      Sts::IsoSts::CustomMetaGroup => custom_meta,
      Sts::IsoSts::License => license,
      Sts::IsoSts::TermDisplay => term_display,
      Sts::IsoSts::TermHead => term_head,
    }

    examples.each do |model, xml|
      expect(model.to_xml(model.from_xml(xml))).to be_xml_equivalent_to(xml)
    end
  end
end
