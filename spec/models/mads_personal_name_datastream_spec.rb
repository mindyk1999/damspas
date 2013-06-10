# -*- encoding: utf-8 -*-
require 'spec_helper'

describe MadsPersonalNameDatastream do

  describe "a complex data model" do

    describe "a new instance" do
      subject { MadsPersonalNameDatastream.new(stub('inner object', :pid=>'bbXXXXXXXXX23', :new? =>true), 'damsMetadata') }
      it "should have a subject" do
        subject.rdf_subject.to_s.should == "http://library.ucsd.edu/ark:/20775/bbXXXXXXXXX23"
      end

      it "should have a name" do
        subject.name = "Maria"
        subject.name.should == ["Maria"]
      end   
      it "should have authority" do
        subject.authority = "naf"
        subject.authority.should == ["naf"]
      end  
 
      it "should have full name" do
        list = subject.elementList.first
	    if list != nil   
	    	list[0].elementValue = "Burns, Jack O."
	    	list[0].elementValue.should == ["Burns, Jack O."]
	    end
      end       
    end

    describe "an instance with content" do
      subject do
        subject = MadsPersonalNameDatastream.new(stub('inner object', :pid=>'bd93182924', :new? =>true), 'damsMetadata')
        subject.content = File.new('spec/fixtures/madsPersonalName.rdf.xml').read
        subject
      end
      
      
      it "should have name" do
        subject.name.should == ["Burns, Jack O., 1977-"]
      end

      it "should have a externalAuthority value" do
        subject.externalAuthority.to_s.should == "http://id.loc.gov/authorities/subjects/sh85012026"
      end
 
      it "should have an authority" do
        subject.authority.should == ["naf"]
      end
           
      it "should have fields" do
        list = subject.elementList.first
        list[0].should be_kind_of MadsPersonalNameDatastream::List::FullNameElement
        list[0].elementValue.should == ["Burns, Jack O."]  
        list[1].should be_kind_of MadsPersonalNameDatastream::List::FamilyNameElement
        list[1].elementValue.should == ["Burns"]   
        list[2].should be_kind_of MadsPersonalNameDatastream::List::GivenNameElement
        list[2].elementValue.should == ["Jack O."]  
        list[3].should be_kind_of MadsPersonalNameDatastream::List::DateNameElement
        list[3].elementValue.should == ["1977-"]        
        list.size.should == 4        
      end  
      
      it "should have a fields from solr doc" do
        solr_doc = subject.to_solr
        solr_doc["full_name_element_tesim"].should == ["Burns, Jack O."]
        solr_doc["family_name_element_tesim"].should == ["Burns"] 
        solr_doc["given_name_element_tesim"].should == ["Jack O."]
        solr_doc["date_name_element_tesim"].should == ["1977-"] 
      end    
    end
  end
end
