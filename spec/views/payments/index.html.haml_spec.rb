require 'spec_helper'

describe "payments/index.html.haml" do
  before(:each) do
    assign(:payments, [
      stub_model(Payment,
        :amount => 1.5,
        :transaction_id => "Transaction"
      ),
      stub_model(Payment,
        :amount => 1.5,
        :transaction_id => "Transaction"
      )
    ])
  end

  it "renders a list of payments" do
    render
    rendered.should have_selector("tr>td", :content => 1.5.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Transaction".to_s, :count => 2)
  end
end
