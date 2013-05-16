
describe "DamsResource" do

  describe "MADS accessors" do
    before do
      params = {
        myResource: {
          topic: "Cosmology",
          temporal: "16th Century",
          personalName: {
            fullName: "Jefferson, Thomas",
            dateName: "1743-1826" 
          },
          personalName: {
            fullName: "Jefferson, Thomas",
            dateName: "1743-1826" 
          },
          corporateName: {
            name: "University of California, San Diego.",
            name: "University Library",  
          },
          complexSubject: {
            personalName: {
              fullName: "Jeffersion, Thomas",
              dateName: "1743-1826" 
            },
            topic: "Presidency", 
            temporal: "1801-1809" 
          },  
    
        }
      }
      @resource = DamsResource.new()
      @resource.update_attributes(params[:myResource])
    end

    it "should support topic, temporal" do
      # TopicElement
      @resource.topic.should == ["Cosmology"]
      # OR ??? @resource.topic.should == ["Cosmology", "Presidency"]  ???

      # TemporalElement
      @resource.temporal.should == ["16th Century"]
      # OR ??? @resource.temporal.should == ["16th Century", "1801-1809"]  ???
    end

    describe "personalName" do

      it "should support MADS.PersonalName structures" do
        @resource.personalName(0).fullName.should == ["Jefferson, Thomas"]
        @resource.personalName(0).fullName(0).elementValue.should == "Jefferson, Thomas"
        @resource.personalName(0).dateName.should == ["1743-1826"]
        @resource.personalName(1).fullName.should == ["Hemings, Sally"]
      end
      
      it "should aggregate subelement values in authoritativeLabel" do
        @resource.personalName.should == ["Jefferson, Thomas, 1743-1826", "Hemings, Sally"]
        @resource.personalName(0).authoritativeLabel.should == "Jefferson, Thomas, 1743-1826"
      end

      it "Insertion Operator `<<` when given a String should create a PersonalNameElement and put the string into its FullNameElement" do
        @resource.personalName << "Jefferson Randolph, Martha"
        @resource.personalName.should == ["Jefferson, Thomas, 1743-1826", "Hemings, Sally", "Jefferson Randolph, Martha"]
        @resource.personalName(1).fullName.should == ["Jefferson Randolph, Martha"]
      end
      
      it "Insertion Operator `<<` when given a Node should simply insert it" do
        new_name = MADS::PersonalName.new(@resource.graph)
        new_name.fullName = "Callender, James T."
        new_name.dateName = "1802"
        @resource.personalName << new_name
        @resource.personalName(1).authoritativeLabel.should == "Callender, James T., 1802"
        @resource.personalName(1).fullName.should == ["Callender, James T."]
        @resource.personalName(1).dateName.should == ["1802"]
      end
      
      it "Insertion Operator `<<` when given a Hash should use update_attributes behavior" do
        @resource.personalName << {fullName:"Callender, James T.", dateName: "dateName"}
        @resource.personalName(1).authoritativeLabel.should == "Callender, James T., 1802"
        @resource.personalName(1).fullName.should == ["Callender, James T."]
        @resource.personalName(1).dateName.should == ["1802"]
      end
    end
    
    it "should support MADS.CorporateName structures" do
      @resource.corporateName.should == ["University of California, San Diego., University Library"]
      @resource.corporateName(0).fullName.should == ["University of California, San Diego."]
      @resource.corporateName(0).dateName.should == ["University Library"]
    end
    
    describe "complexSubject" do
      it "should support MADS.ComplexSubject structures" do
        @resource.complexSubject(0).personalName.should ==  ["Jefferson, Thomas, 1743-1826"]
        @resource.complexSubject(0).topic.should ==  ["Presidency"]
        @resource.complexSubject(0).temporal.should ==  ["1801-1809"]
      end
      it "should aggregate subelement values in authoritativeLabel" do
        @resource.complexSubject.should == ["Jefferson, Thomas, 1743-1826--Presidency--1801-1809"]
        @resource.complexSubject(0).authoritativeLabel.should == "Jefferson, Thomas, 1743-1826--Presidency--1801-1809"
      end
    end


    it "should create proper XML when stuff has been inserted" do
      @resource.personalName << "Jefferson Randolph, Martha"
      @resource.complexSubject << {personalName: "Callender, James T.", topic:"Newspapers"}
      @resource.content.should be_equivalent_to fixture("damsSubjectExpectedOutput.rdf.xml")
    end
  end
end
