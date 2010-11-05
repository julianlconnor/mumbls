require 'spec_helper'

describe "housings/show.html.haml" do
  before(:each) do
    @housing = assign(:housing, stub_model(Housing,
      :title => "Title",
      :description => "MyText",
      :address => "Address",
      :price => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain("Address".to_s)
    rendered.should contain(1.to_s)
  end
end
