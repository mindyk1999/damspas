require 'spec_helper'

describe DamsRepositoryDatastream do

  describe "a repository model" do

    describe "instance populated in-memory" do

      subject { DamsRepositoryDatastream.new(stub('inner object', :pid=>'bbXXXXXX24', :new? => true), 'damsMetadata') }

      it "should have a subject" do
        subject.rdf_subject.to_s.should == "#{Rails.configuration.repository_root}bbXXXXXX24"
      end

      it "should have a name" do
        subject.name = "Test Repository"
        subject.name.should == ["Test Repository"]
      end

      it "should have a description" do
        subject.description = "Test Repository Description"
        subject.description.should == ["Test Repository Description"]
      end

      it "should have a uri" do
        subject.uri = "http://library.ucsd.edu/repositories/test/"
        subject.uri.should == ["http://library.ucsd.edu/repositories/test/"]
      end

    end

    describe "an instance loaded from fixture xml" do

      subject do
        subject = DamsRepositoryDatastream.new(stub('inner object', :pid=>'bb45454545', :new? =>true), 'damsMetadata')
        subject.content = File.new('spec/fixtures/damsRepository.rdf.xml').read
        subject
      end

      it "should have a subject" do
        subject.rdf_subject.to_s.should == "#{Rails.configuration.repository_root}bb45454545"
      end

      it "should have a name" do
        subject.name.should == ["RCI"]
      end

      it "should have a description" do
        subject.description.should == ["Research Cyberinfrastructure: the hardware, software, and people that support scientific research."]
      end

      it "should have a uri" do
        subject.uri.should == ["http://library.ucsd.edu/repositories/rci/"]
      end

    end
  end
end
