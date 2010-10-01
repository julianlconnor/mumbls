require 'spec_helper'

describe "listings/new.html.haml" do
  before(:each) do
    assign(:listing, stub_model(Listing,
      :new_record? => true,
      :author => "MyString",
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new listing form" do
    render

    rendered.should have_selector("form", :action => listings_path, :method => "post") do |form|
      form.should have_selector("input#listing_author", :name => "listing[author]")
      form.should have_selector("input#listing_title", :name => "listing[title]")
      form.should have_selector("textarea#listing_description", :name => "listing[description]")
    end
  end
end
