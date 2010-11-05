require 'spec_helper'

describe "housings/index.html.haml" do
  before(:each) do
    assign(:housings, [
      stub_model(Housing,
        :title => "Title",
        :description => "MyText",
        :address => "Address",
        :price => 1
      ),
      stub_model(Housing,
        :title => "Title",
        :description => "MyText",
        :address => "Address",
        :price => 1
      )
    ])
  end

  it "renders a list of housings" do
    render
    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Address".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
