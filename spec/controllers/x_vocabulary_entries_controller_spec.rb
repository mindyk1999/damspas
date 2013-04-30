require 'spec_helper'

describe XVocabularyEntriesController do
  describe "A login user" do
	  before do
	  	sign_in User.create!
	  end
	  describe "Show" do
	    before do
	      @obj = XVocabularyEntry.create(value: "Vocabulary Entry value", x_vocabulary: XVocabulary.new(pid:"bb43434343",description:"Sample Vocab") )
	    end
	    it "should be successful" do 
	      get :show, id: @obj.id
	      response.should be_successful 
	      @obj2 = assigns[:x_vocabulary_entry]
          @obj2.value.should == ["Vocabulary Entry value"]
          @obj2.should == @obj
	    end
	  end
	  
	  describe "New" do
	    it "should be successful" do 
	      get :new
	      response.should be_successful 
	      assigns[:x_vocabulary_entry].should be_kind_of XVocabularyEntry
	    end
	  end
	  
	  describe "Edit" do
	    before do
	      @obj = XVocabularyEntry.create(value: "Vocabulary Entry test update", x_vocabulary: XVocabulary.new(pid:"bb43434343",description:"Sample Vocab") )
	    end    
	    it "should be successful" do 
	      get :edit, id: @obj.id
	      response.should be_successful 
	      assigns[:x_vocabulary_entry].should == @obj
	    end
	  end
	  
	  describe "Create" do
	    it "should be successful" do
	      expect { 
	        post :create, :x_vocabulary_entry => {value: ["Test Title"],x_vocabulary: XVocabulary.new(pid:"bb43434343",description:"Sample Vocab") }
        }.to change { XVocabularyEntry.count }.by(1)
	      response.should redirect_to assigns[:x_vocabulary_entry]
	      assigns[:x_vocabulary_entry].should be_kind_of XVocabularyEntry
	    end
	  end
	  
	  describe "Update" do
	    before do
 	      @obj = XVocabularyEntry.create(value: "Vocabulary Entry Test Title", x_vocabulary: XVocabulary.new(pid:"bb43434343",description:"Sample Vocab"))
 	  end
	  it "should be successful" do
	      put :update, :id => @obj.id, :x_vocabulary_entry => {value: ["Test Title2"], x_vocabulary: XVocabulary.new(pid:"http://library.ucsd.edu/ark:/20775/bb43434343", description: "Test Vocab")}
	      response.should redirect_to assigns[:x_vocabulary_entry]
	      @obj.reload.value.should == ["Test Title2"]
	      flash[:notice].should == "Successfully updated vocabulary entry"
      end
    end
  end
end
