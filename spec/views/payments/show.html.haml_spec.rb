require 'spec_helper'

describe "payments/show.html.haml" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :amount => 1.5,
      :transaction_id => "Transaction"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.5.to_s)
    rendered.should contain("Transaction".to_s)
  end
end
