require 'spec_helper'

describe HousingsController do

  def mock_housing(stubs={})
    @mock_housing ||= mock_model(Housing, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all housings as @housings" do
      Housing.stub(:all) { [mock_housing] }
      get :index
      assigns(:housings).should eq([mock_housing])
    end
  end

  describe "GET show" do
    it "assigns the requested housing as @housing" do
      Housing.stub(:find).with("37") { mock_housing }
      get :show, :id => "37"
      assigns(:housing).should be(mock_housing)
    end
  end

  describe "GET new" do
    it "assigns a new housing as @housing" do
      Housing.stub(:new) { mock_housing }
      get :new
      assigns(:housing).should be(mock_housing)
    end
  end

  describe "GET edit" do
    it "assigns the requested housing as @housing" do
      Housing.stub(:find).with("37") { mock_housing }
      get :edit, :id => "37"
      assigns(:housing).should be(mock_housing)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created housing as @housing" do
        Housing.stub(:new).with({'these' => 'params'}) { mock_housing(:save => true) }
        post :create, :housing => {'these' => 'params'}
        assigns(:housing).should be(mock_housing)
      end

      it "redirects to the created housing" do
        Housing.stub(:new) { mock_housing(:save => true) }
        post :create, :housing => {}
        response.should redirect_to(housing_url(mock_housing))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved housing as @housing" do
        Housing.stub(:new).with({'these' => 'params'}) { mock_housing(:save => false) }
        post :create, :housing => {'these' => 'params'}
        assigns(:housing).should be(mock_housing)
      end

      it "re-renders the 'new' template" do
        Housing.stub(:new) { mock_housing(:save => false) }
        post :create, :housing => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested housing" do
        Housing.should_receive(:find).with("37") { mock_housing }
        mock_housing.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :housing => {'these' => 'params'}
      end

      it "assigns the requested housing as @housing" do
        Housing.stub(:find) { mock_housing(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:housing).should be(mock_housing)
      end

      it "redirects to the housing" do
        Housing.stub(:find) { mock_housing(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(housing_url(mock_housing))
      end
    end

    describe "with invalid params" do
      it "assigns the housing as @housing" do
        Housing.stub(:find) { mock_housing(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:housing).should be(mock_housing)
      end

      it "re-renders the 'edit' template" do
        Housing.stub(:find) { mock_housing(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested housing" do
      Housing.should_receive(:find).with("37") { mock_housing }
      mock_housing.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the housings list" do
      Housing.stub(:find) { mock_housing }
      delete :destroy, :id => "1"
      response.should redirect_to(housings_url)
    end
  end

end
