require 'spec_helper'

describe "listings/edit.html.haml" do
  before(:each) do
    @listing = assign(:listing, stub_model(Listing,
      :new_record? => false,
      :author => "MyString",
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit listing form" do
    render

    rendered.should have_selector("form", :action => listing_path(@listing), :method => "post") do |form|
      form.should have_selector("input#listing_author", :name => "listing[author]")
      form.should have_selector("input#listing_title", :name => "listing[title]")
      form.should have_selector("textarea#listing_description", :name => "listing[description]")
    end
  end
end
