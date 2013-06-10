require 'spec_helper'

describe MADSSchemesController do
  describe "A logged-in user" do
	  before do
	  	sign_in User.create!
    	#DamsVocabularyEntry.find_each{|z| z.delete}
	  end
	  describe "Show" do
	    before do
	      @obj = MADSScheme.create( code: "test", name: "Test Scheme" )
	    end
	    it "should be successful" do 
	      get :show, id: @obj.id
	      response.should be_successful 
	      @newobj = assigns[:mads_scheme]
          @newobj.code.should == @obj.code
          @newobj.name.should == @obj.name
	    end
	  end
	  
	  describe "New" do
	    it "should be successful" do 
	      get :new
	      response.should be_successful 
	      assigns[:mads_scheme].should be_kind_of MADSScheme
	    end
	  end
	  
	  describe "Edit" do
	    before do
	      @obj = MADSScheme.create(code: "test", name: "Test Scheme")
	    end    
	    it "should be successful" do 
	      get :edit, id: @obj.id
	      response.should be_successful 
	      @newobj = assigns[:mads_scheme]
          @newobj.code.should == @obj.code
          @newobj.name.should == @obj.name
	    end
	  end
	  
	  describe "Create" do
	    it "should be successful" do
	      expect { 
	        post :create, :mads_scheme => {code: "test", name: "Test Scheme"}
        }.to change { MADSScheme.count }.by(1)
	      response.should redirect_to assigns[:mads_scheme]
	      assigns[:mads_scheme].should be_kind_of MADSScheme
	    end
	  end
	  
	  describe "Update" do
	    before do
 	      @obj = MADSScheme.create(code: "test", name: "Test Scheme")
 	    end
	    it "should be successful" do
	      put :update, :id => @obj.id, :mads_scheme => {code: ["test2"], name: ["Test Scheme 2"]}
	      response.should redirect_to assigns[:mads_scheme]
	      @newobj = assigns[:mads_scheme]
          @newobj.value.should == ["Test Scheme 2"]
	      flash[:notice].should == "Successfully updated MADSScheme"
	    end
    end
  end
end

