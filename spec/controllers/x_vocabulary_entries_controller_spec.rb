require 'spec_helper'

describe XVocabularyEntriesController do
  describe "logged in user" do
	  before do
	  	sign_in User.create!
	  end
	  describe "Show" do
	    before do
	      @obj = XVocabularyEntry.create(value: "Vocabulary Entry value", vocabulary: "#{Rails.configuration.id_namespace}bb43434343")
	    end
	    it "should be successful" do 
	      get :show, id: @obj.id
	      response.should be_successful 
	      @obj2 = assigns[:x_vocabulary_entry]
          @obj2.value.should == ["Vocabulary Entry value"]
          @obj2.should == @obj
          @obj2.vocabulary.first.to_s.should == "#{Rails.configuration.id_namespace}bb43434343"
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
 	      @vocab1 = XVocabulary.create(description: "Test Vocab 1")
 	      @vocab2 = XVocabulary.create(description: "Test Vocab 2")
 	      @obj = XVocabularyEntry.create(value: "Test Title 1", code: "1", vocabulary:"#{Rails.configuration.id_namespace}#{@vocab1.pid}")
 	  end
	  it "should be successful" do
	      put :update, :id => @obj.id, :x_vocabulary_entry => {code: ["2"], value: ["Test Title 2"], vocabulary: @vocab2.pid }
	      response.should redirect_to assigns[:x_vocabulary_entry]
	      flash[:notice].should == "Successfully updated vocabulary entry"

          @obj2 = assigns[:x_vocabulary_entry]
          @obj2.value.should == ["Test Title 2"]
          @obj2.code.should == ["2"]
          @obj2.vocabulary.first.to_s.should == "#{Rails.configuration.id_namespace}#{@vocab2.pid}"
      end
    end
  end
end
