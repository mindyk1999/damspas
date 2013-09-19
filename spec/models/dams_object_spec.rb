require 'spec_helper'

describe DamsObject do
  
  before  do
    @damsObj = DamsObject.new(pid: 'bb52572546')
  end
  
  it "should have the specified datastreams" do
    @damsObj.datastreams.keys.should include("damsMetadata")
    @damsObj.damsMetadata.should be_kind_of DamsObjectDatastream
  end
  
  it "should create/update a title" do
    @damsObj.title.build
    #@damsObj.titleValue.should == []
    @damsObj.titleValue = "Dams Object Title 1"
    @damsObj.titleValue.should == "Dams Object Title 1"
  
    @damsObj.titleValue = "Dams Object Title 2"
    @damsObj.titleValue.should == "Dams Object Title 2"
  end

  it "should create/update a subject" do
    @damsObj.topic.build
    @damsObj.topic.first.name = "topic 1"
    @damsObj.topic.first.name.should == ["topic 1"]
    @damsObj.topic << MadsTopic.new( :name => "topic 2" )
    pending "should be able to access second and subsequent topics..."
    @damsObj.topic[1].name.should == ["topic 2"]

    @damsObj.topic.first.name = "topic 3"
    @damsObj.topic.first.name.should == ["topic 3"]
    @damsObj.topic.second.name = "topic 4"
    @damsObj.topic.second.name.should == ["topic 4"]
  end

  describe "Store to a repository" do
    before do
      MadsPersonalName.create! pid: "zzXXXXXXX1", name: "Maria", externalAuthority: "someUrl"
    end
    after do
      #@damsObj.delete
    end
    it "should store/retrieve from a repository" do
      @damsObj.damsMetadata.content = File.new('spec/fixtures/dissertation.rdf.xml').read
      @damsObj.save!
      @damsObj.reload
      loadedObj = DamsObject.find(@damsObj.pid)
      loadedObj.titleValue.should == "Chicano and black radical activism of the 1960s"
    end
  end

  subject do
    DamsObject.new pid: 'bb80808080'
  end
  it "should load a complex object from RDF/XML file" do
    subject = DamsObject.new(:pid=>'bb80808080')

    subject.damsMetadata.content = File.new('spec/fixtures/damsComplexObject1.rdf.xml').read
    subject.titleValue.should == "Sample Complex Object Record #1"
    subject.component.first.title.first.value.should == "The Static Image"
    subject.sourceCapture.scannerManufacturer.should == ["Epson"]
  end

  let(:params) {	
    {  
       title_attributes: [
    	  name: "Sample Complex Object Record #1",
          mainTitleElement_attributes: [{ elementValue: "Sample Complex Object Record #1" }],
          subTitleElement_attributes: [{ elementValue: "a newspaper PDF with a single attached image" }],
          hasVariant_attributes: [{ variantLabel: "The Whale" }],
          hasTranslationVariant_attributes: [{ variantLabel: "Translation Variant" }],
          hasAbbreviationVariant_attributes: [{ variantLabel: "Abbreviation Variant" }],
          hasAcronymVariant_attributes: [{ variantLabel: "Acronym Variant" }],
          hasExpansionVariant_attributes: [{ variantLabel: "Expansion Variant" }]
        ],
        date_attributes: [value: "May 24, 1980", beginDate: "1980-05-24",endDate: "1980-05-24"],
        relationship_attributes: [name: RDF::Resource.new("#{Rails.configuration.id_namespace}bbXXXXXXX1"),role: RDF::Resource.new("#{Rails.configuration.id_namespace}bbXXXXXXX2")],
        language_attributes: [name: "TestLang", code: "test"],
        language: RDF::Resource.new("#{Rails.configuration.id_namespace}xx00000170"),
        note_attributes:[displayLabel: "ARK ID", value: "http://library.ucsd.edu/ark:/20775/bb80808080", type: "identifier"],  
        custodialResponsibilityNote_attributes:[displayLabel: "Digital object made available by", value: "Mandeville Special Collections Library", type: "custodial_history"],  
        preferredCitationNote_attributes:[displayLabel: "Citation", value: "Data at Redshift=1.4 (RD0022)", type: "citation"],  
        scopeContentNote_attributes:[displayLabel: "Scope and contents", value: "Electronic theses and dissertations submitted by UC San Diego students", type: "scope_and_content"],     
        topic_attributes: [name: "test subject"],
        copyright: RDF::Resource.new("#{Rails.configuration.id_namespace}bb05050505"),
        statute: RDF::Resource.new("#{Rails.configuration.id_namespace}bb21212121"),
        otherRights: RDF::Resource.new("#{Rails.configuration.id_namespace}bb06060606"),
        license: RDF::Resource.new("#{Rails.configuration.id_namespace}bb22222222"),
        rightsHolderPersonal: RDF::Resource.new("#{Rails.configuration.id_namespace}bb09090909")
  }}
  subject do
    DamsObject.new(pid: 'xx80808080').tap do |t|
      t.attributes = params
    end
  end
    
#  subject do
#    DamsObject.new pid: "xx80808080"
#  end
  it "should create a rdf/xml" do
#    subject.titleValue = "Sample Complex Object Record #1"
#    subject.subtitle = "a newspaper PDF with a single attached image"
#    subject.titleVariant = "The Whale"
#    subject.titleTranslationVariant = "Translation Variant"
#    subject.titleAbbreviationVariant = "Abbreviation Variant"
#    subject.titleAcronymVariant = "Acronym Variant"
#    subject.titleExpansionVariant = "Expansion Variant"
#    subject.dateValue = "May 24, 1980"
#    subject.beginDate = "1980-05-24"
#    subject.endDate = "1980-05-24"
#    subject.subjectValue = ["Black Panther Party--History"]
#    subject.subjectURI = ["bd6724414c"]
#    subject.topic.build.name = "test subject"
#    subject.languageURI = ["xx00000170"]
#    subject.assembledCollectionURI = ["bb03030303"]
#    subject.provenanceCollectionURI = ["bb24242424"]
#    subject.relationshipRoleURI = ["bd8396905c"]
#    subject.relationshipNameType = ["CorporateName"]
#    subject.relationshipNameURI = ["bd8294487v"]      
#    subject.nameType = ["PersonalName"]
#    subject.nameURI = ["xx11111111"]
#    subject.nameTypeValue = ["inline personal name"]
#    subject.copyrightURI = ["bb05050505"]
#    subject.statuteURI = ["bb21212121"]
#    subject.otherRightsURI = ["bb06060606"]
#    subject.licenseURI = ["bb22222222"]
#    subject.rightsHolderURI = ["bb09090909"]
	bn_id = subject.title[0].hasVariant[0].rdf_subject.id
    bn_id_trans = subject.title[0].hasTranslationVariant[0].rdf_subject.id
    bn_id_abb = subject.title[0].hasAbbreviationVariant[0].rdf_subject.id
    bn_id_acro = subject.title[0].hasAcronymVariant[0].rdf_subject.id
    bn_id_exp = subject.title[0].hasExpansionVariant[0].rdf_subject.id

    xml =<<END
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:dams="http://library.ucsd.edu/ontology/dams#"
    xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:mads="http://www.loc.gov/mads/rdf/v1#"
    xmlns:damsid="#{Rails.configuration.id_namespace}">
<dams:Object rdf:about="#{Rails.configuration.id_namespace}xx80808080">   
    <dams:assembledCollection rdf:resource="#{Rails.configuration.id_namespace}bb03030303"/>
    <dams:copyright rdf:resource="http://library.ucsd.edu/ark:/20775/bb05050505"/>
	<dams:date>
      <dams:Date>
        <dams:beginDate>1980-05-24</dams:beginDate>
        <dams:endDate>1980-05-24</dams:endDate>
        <rdf:value>May 24, 1980</rdf:value>        
      </dams:Date>
    </dams:date>    
    <dams:language rdf:resource="#{Rails.configuration.id_namespace}xx00000170"/> 
    <dams:license rdf:resource="http://library.ucsd.edu/ark:/20775/bb22222222"/>
    <dams:otherRights rdf:resource="http://library.ucsd.edu/ark:/20775/bb06060606"/>
    <dams:personalName>
      <mads:PersonalName>
        <mads:authoritativeLabel>inline personal name</mads:authoritativeLabel>
      </mads:PersonalName>
    </dams:personalName> 
    <dams:personalName rdf:resource="#{Rails.configuration.id_namespace}xx11111111"/>    
    <dams:provenanceCollection rdf:resource="#{Rails.configuration.id_namespace}bb24242424"/>  
    <dams:relationship>
      <dams:Relationship>
        <dams:corporateName rdf:resource="#{Rails.configuration.id_namespace}bd8294487v"/>
        <dams:role rdf:resource="#{Rails.configuration.id_namespace}bd8396905c"/>        
      </dams:Relationship>
    </dams:relationship>      
    <dams:rightsHolder rdf:resource="http://library.ucsd.edu/ark:/20775/bb09090909"/>
    <dams:statute rdf:resource="http://library.ucsd.edu/ark:/20775/bb21212121"/>
    <dams:subject>
      <mads:ComplexSubject>
       <mads:authoritativeLabel>Black Panther Party--History</mads:authoritativeLabel>
      </mads:ComplexSubject>
    </dams:subject>        
    <dams:subject rdf:resource="#{Rails.configuration.id_namespace}bd6724414c"/>    
    <dams:title>
      <mads:Title>
        <mads:authoritativeLabel>Sample Complex Object Record #1: a newspaper PDF with a single attached image</mads:authoritiatveLabel>
        <mads:elementList rdf:parseType="Collection">
          <mads:MainTitleElement>
            <mads:elementValue>Sample Complex Object Record #1</mads:elementValue>
          </mads:MainTitleElement>
          <mads:SubTitleElement>
            <mads:elementValue>a newspaper PDF with a single attached image</mads:elementValue>
          </mads:SubTitleElement>
        </mads:elementList>
        <mads:hasAbbreviationVariant rdf:nodeID="#{bn_id_abb}"/>
        <mads:hasAcronymVariant rdf:nodeID="#{bn_id_acro}"/>
        <mads:hasExpansionVariant rdf:nodeID="#{bn_id_exp}"/>          
        <mads:hasTranslationVariant rdf:nodeID="#{bn_id_trans}"/>
         <mads:hasVariant rdf:nodeID="#{bn_id}"/>       
      </mads:Title>
    </dams:title>
    <dams:topic>
        <mads:Topic>
            <mads:authoritativeLabel>test subject</mads:authoritativeLabel>
        </mads:Topic>
    </dams:topic>    
     </dams:Object>
     <mads:Variant rdf:nodeID="#{bn_id_abb}">
       <mads:variantLabel>Abbreviation Variant</mads:variantLabel>
     </mads:Variant>     
     <mads:Variant rdf:nodeID="#{bn_id}">
       <mads:variantLabel>The Whale</mads:variantLabel>
     </mads:Variant>
     <mads:Variant rdf:nodeID="#{bn_id_trans}">
       <mads:variantLabel>Translation Variant</mads:variantLabel>
     </mads:Variant>
     <mads:Variant rdf:nodeID="#{bn_id_acro}">
       <mads:variantLabel>Acronym Variant</mads:variantLabel>
     </mads:Variant>    
     <mads:Variant rdf:nodeID="#{bn_id_exp}">
       <mads:variantLabel>Expansion Variant</mads:variantLabel>
     </mads:Variant>                             
</rdf:RDF>
END
    subject.damsMetadata.content.should be_equivalent_to xml
  end  
end
