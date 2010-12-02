require 'spec_helper'

describe "payments/edit.html.haml" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :new_record? => false,
      :amount => 1.5,
      :transaction_id => "MyString"
    ))
  end

  it "renders the edit payment form" do
    render

    rendered.should have_selector("form", :action => payment_path(@payment), :method => "post") do |form|
      form.should have_selector("input#payment_amount", :name => "payment[amount]")
      form.should have_selector("input#payment_transaction_id", :name => "payment[transaction_id]")
    end
  end
end
