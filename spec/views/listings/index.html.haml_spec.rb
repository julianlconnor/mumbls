require 'spec_helper'

describe "listings/index.html.haml" do
  before(:each) do
    assign(:listings, [
      stub_model(Listing,
        :author => "Author",
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Listing,
        :author => "Author",
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of listings" do
    render
    rendered.should have_selector("tr>td", :content => "Author".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
