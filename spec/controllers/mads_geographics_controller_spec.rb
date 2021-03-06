require 'spec_helper'

describe MadsGeographicsController do
	before do
		sign_in User.create!
  end

  describe "when signed in" do
    describe "#new" do
      it "should set the values needed to draw the form" do
        get :new
        response.should be_success
        assigns[:mads_geographic].should be_kind_of MadsGeographic
        assigns[:mads_geographic].geographicElement.size.should == 1
      end
    end

    describe "#create" do
      let!(:scheme) { MadsScheme.create(code: 'test', name: 'Test Scheme')}
      after { scheme.destroy }

      it "should set the attributes" do
        post :create, mads_geographic: {"name"=>"TestLabel", "externalAuthority"=>"http://test.com", "geographicElement_attributes"=>{"0"=>{"elementValue"=>"Baseball"}}, "scheme_attributes"=>[{"id"=>"http://library.ucsd.edu/ark:/20775/#{scheme.pid}"}]}
        flash[:notice].should == "Geographic has been saved"
        response.should redirect_to mads_geographic_path(assigns[:mads_geographic])

        assigns[:mads_geographic].elementList.size.should == 1

        assigns[:mads_geographic].scheme.first.code.should == ['test']
        assigns[:mads_geographic].scheme.first.name.should == ['Test Scheme']

      end
    end

    describe "#update" do
      let!(:scheme1) { MadsScheme.create(code: 'test', name: 'Test Scheme')}
      let!(:scheme2) { MadsScheme.create(code: 'test', name: 'Test Scheme')}
      let!(:geographic) { MadsGeographic.create(scheme_attributes: [{"id"=>"http://library.ucsd.edu/ark:/20775/#{scheme1.pid}"}])}
      after do
        geographic.destroy 
        scheme1.destroy
        scheme2.destroy
      end

      it "should set the attributes" do
        put :update, id: geographic, mads_geographic: {"name"=>"TestLabel", "externalAuthority"=>"http://test.com", "geographicElement_attributes"=>{"0"=>{"elementValue"=>"Baseball"}}, "scheme_attributes"=>[{"id"=>"http://library.ucsd.edu/ark:/20775/#{scheme2.pid}"}]}
        flash[:notice].should == "Successfully updated Geographic"
        response.should redirect_to mads_geographic_path(assigns[:mads_geographic])

        assigns[:mads_geographic].elementList.size.should == 1

        assigns[:mads_geographic].scheme.size.should == 1
        assigns[:mads_geographic].scheme.first.code.should == ['test']
        assigns[:mads_geographic].scheme.first.name.should == ['Test Scheme']

      end
    end
  end

end
