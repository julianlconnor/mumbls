require "spec_helper"

describe HousingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/housings" }.should route_to(:controller => "housings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/housings/new" }.should route_to(:controller => "housings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/housings/1" }.should route_to(:controller => "housings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/housings/1/edit" }.should route_to(:controller => "housings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/housings" }.should route_to(:controller => "housings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/housings/1" }.should route_to(:controller => "housings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/housings/1" }.should route_to(:controller => "housings", :action => "destroy", :id => "1")
    end

  end
end
