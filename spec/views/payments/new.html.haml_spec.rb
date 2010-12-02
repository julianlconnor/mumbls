require 'spec_helper'

describe "payments/new.html.haml" do
  before(:each) do
    assign(:payment, stub_model(Payment,
      :new_record? => true,
      :amount => 1.5,
      :transaction_id => "MyString"
    ))
  end

  it "renders new payment form" do
    render

    rendered.should have_selector("form", :action => payments_path, :method => "post") do |form|
      form.should have_selector("input#payment_amount", :name => "payment[amount]")
      form.should have_selector("input#payment_transaction_id", :name => "payment[transaction_id]")
    end
  end
end
