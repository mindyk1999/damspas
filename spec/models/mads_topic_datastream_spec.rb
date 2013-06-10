# -*- encoding: utf-8 -*-
require 'spec_helper'

describe MadsTopicDatastream do

  describe "a complex data model" do

    describe "a new instance" do
      subject { MadsTopicDatastream.new(stub('inner object', :pid=>'bbXXXXXXXXX23', :new? =>true), 'damsMetadata') }
      it "should have a subject" do
        subject.rdf_subject.to_s.should == "http://library.ucsd.edu/ark:/20775/bbXXXXXXXXX23"
      end

      it "should have a name" do
        subject.name = "Baseball"
        subject.name.should == ["Baseball"]
      end   
      it "should have authority" do
        subject.authority = "lcsh"
        subject.authority.should == ["lcsh"]
      end    
      
 	  it "when given a Node should simply insert it" do
        pending "TODO: Should this be the behavior? -MZ 05/2013"
        new_node = RDF::Node.new
        subject.topic << new_node
        subject.topic.first.should == new_node
      end  
      
      it "should build proper rdf graph" do
        subject.topic.build("Cosmology")
        subject.topic.build("Quantum States")
        
        # (Grabbing node ids for use in expected_xml assertion)
        list1_id = subject.topic[0].elementList[0].rdf_subject.id
        list2_id = subject.topic[1].elementList[0].rdf_subject.id
        
        expected_xml = '<?xml version="1.0" encoding="UTF-8"?>
			<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:ns0="http://www.loc.gov/mads/rdf/v1#">
			<rdf:Description rdf:about="info:fedora/foo">
			<ns0:Topic>
			<rdf:Description>
			<ns0:elementList rdf:nodeID="'+list1_id+'"/>
			</rdf:Description>
			</ns0:Topic>
			<ns0:Topic>
			<rdf:Description>
			<ns0:elementList rdf:nodeID="'+list2_id+'"/>
			</rdf:Description>
			</ns0:Topic>
			</rdf:Description>
			<ns0:elementList rdf:nodeID="'+list1_id+'">
			<ns0:TopicElement>Cosmology</ns0:TopicElement>
			</ns0:elementList>
			<ns0:elementList rdf:nodeID="'+list2_id+'">
			<ns0:TopicElement>Quantum States</ns0:TopicElement>
			</ns0:elementList>
			</rdf:RDF>'
        
        subject-p9oml0p.graph.dump(:rdfxml).should be_equivalent_to expected_xml
      end                
    end

    describe "an instance with content" do
      subject do
        subject = MadsTopicDatastream.new(stub('inner object', :pid=>'bd46424836', :new? =>true), 'damsMetadata')
        subject.content = File.new('spec/fixtures/madsTopic.rdf.xml').read
        subject
      end
      
      
      it "should have name" do
        subject.name.should == ["Baseball"]
      end

      it "should have a sameAs value" do
        subject.sameAs.to_s.should == "http://id.loc.gov/authorities/subjects/sh85012026"
      end
 
      it "should have an authority" do
        subject.authority.should == ["lcsh"]
      end
           
      it "should have fields" do
        list = subject.elementList.first
        list[0].should be_kind_of MadsTopicDatastream::List::TopicElement
        list[0].elementValue.should == ["Baseball"]       
        list.size.should == 1       
      end  
      
      it "should have a fields from solr doc" do
        solr_doc = subject.to_solr
        solr_doc["topic_element_tesim"].should == ["Baseball"]
      end    
    end
  end
end
