# -*- encoding: utf-8 -*-
require 'spec_helper'

describe DamsStylePeriodDatastream do

  describe "a complex data model" do

    describe "a new instance" do
      subject { DamsStylePeriodDatastream.new(double('inner object', :pid=>'bbXXXXXXXXX23', :new? =>true), 'damsMetadata') }
      it "should have a subject" do
        subject.rdf_subject.to_s.should == "#{Rails.configuration.id_namespace}bbXXXXXXXXX23"
      end

      it "should have a name" do
        subject.name = "Impressionism"
        subject.name.should == ["Impressionism"]
      end   
      it "should have scheme" do
        subject.scheme = "bd5495914b"
        subject.scheme.to_s.should == "#{Rails.configuration.id_namespace}bd5495914b"
      end          
    end

    describe "an instance with content" do
      subject do
        subject = DamsStylePeriodDatastream.new(double('inner object', :pid=>'bd0069066b', :new? =>true), 'damsMetadata')
        subject.content = File.new('spec/fixtures/damsStylePeriod.rdf.xml').read
        subject
      end
      
      
      it "should have name" do
        subject.name.should == ["Impressionism"]
      end
 
      it "should have an scheme" do
        subject.scheme.to_s.should == "#{Rails.configuration.id_namespace}bd5495914b"
      end

      it "should have a externalAuthority" do
        subject.externalAuthority.to_s.should == "http://id.loc.gov/XXX05"
      end
                      
      it "should have fields" do
        list = subject.elementList.first
        list[0].should be_kind_of DamsStylePeriodDatastream::List::StylePeriodElement
        list[0].elementValue.should == ["Impressionism"]       
        list.size.should == 1       
      end  
      
      it "should have a fields from solr doc" do
        solr_doc = subject.to_solr
        solr_doc["stylePeriod_element_tesim"].should == ["Impressionism"]
        solr_doc["name_tesim"].should == ["Impressionism"]
        solr_doc["scheme_tesim"].should == ["#{Rails.configuration.id_namespace}bd5495914b"]
        solr_doc["externalAuthority_tesim"].should == ["http://id.loc.gov/XXX05"]
      end    
    end
  end
end
