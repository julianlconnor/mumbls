require 'spec_helper'

describe "listings/show.html.haml" do
  before(:each) do
    @listing = assign(:listing, stub_model(Listing,
      :author => "Author",
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Author".to_s)
    rendered.should contain("Title".to_s)
    rendered.should contain("MyText".to_s)
  end
end
