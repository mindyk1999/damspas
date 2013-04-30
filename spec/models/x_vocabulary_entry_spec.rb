# -*- encoding: utf-8 -*-
require 'spec_helper'

describe XVocabularyEntry do
  subject do
    XVocabularyEntry.new pid: "bb47474747", x_vocabulary: XVocabulary.new( pid: "bb77777777", description: "ISO Country Codes")
  end
  it "should create xml" do
    subject.authority = "ISO 3166-1"
    subject.code = "us"
    subject.value = "United States"
    subject.valueURI = "http://www.loc.gov/standards/mods/"   
    subject.authorityURI = "http://www.loc.gov/standards/mods/"    
    xml =<<END
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
         xmlns:dams="http://library.ucsd.edu/ontology/dams#">
  <dams:VocabularyEntry rdf:about="http://library.ucsd.edu/ark:/20775/bb47474747">
      <dams:authority>ISO 3166-1</dams:authority>
      <dams:authorityURI rdf:resource="http://www.loc.gov/standards/mods/"/>
      <dams:code>us</dams:code>
      <dams:valueURI rdf:resource="http://www.loc.gov/standards/mods/"/>
      <rdf:value>United States</rdf:value>    
  </dams:VocabularyEntry>
</rdf:RDF>
END
    subject.damsMetadata.content.should be_equivalent_to xml
  end
  it "should link to vocabulary" do
    subject.x_vocabulary.description.should == ["ISO Country Codes"]
    subject.x_vocabulary.rdf_subject.to_s.should == 'http://library.ucsd.edu/ark:/20775/bb77777777'
  end
  it "should update vocabulary" do
    newVocab = XVocabulary.new pid:"bb88888888", description:"New Country Codes"
    subject.x_vocabulary = newVocab
    subject.x_vocabulary.description.should == ["New Country Codes"]
    subject.x_vocabulary.rdf_subject.to_s.should == 'http://library.ucsd.edu/ark:/20775/bb88888888'
  end
end
