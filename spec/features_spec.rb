require "promotional_rules"
require "checkout"

RSpec.describe "FEATURE TESTS", feature: true do
  let(:promotional_rules) { PromotionalRules.new }
  subject(:checkout) { Checkout.new promotional_rules }
  let(:item1) {{product_code: 001, name: "Lavender Heart", price: 9.25} }
  let(:item2) {{product_code: 002, name: "Personalised cufflinks", price: 45.00}}
  let(:item3) {{product_code: 003, name: "Kids T-shirt", price: 19.95}}

  let(:item1) {001}
  let(:item2) {002}
  let(:item3) {003}

  it "calculates the price of 001, 002, 003 to £66.78" do
    subject
    subject.scan item1
    subject.scan item2
    subject.scan item3
    expect(subject.total).to eq "£66.78"
  end

  it "calculates the price of 001, 003, 001 to £36.95" do
    subject.scan item1
    subject.scan item3
    subject.scan item1
    expect(subject.total).to eq "£36.95"
  end

  it "calculates the price of 001, 002, 001, 003 to £73.36" do
    subject.scan item1
    subject.scan item3
    subject.scan item1
    expect(subject.total).to eq "£36.95"
  end

end
