require "promotional_rules"

RSpec.describe PromotionalRules do
  subject(:promotional_rules) {PromotionalRules.new}
  let(:product1) { {product_code: 001, name: "Lavender Heart", price: 9.25} }
  let(:product2) {{product_code: 002, name: "Personalised cufflinks", price: 45.00}}
  let(:product3) {{product_code: 003, name: "Kids T-shirt", price: 19.95}}

  let(:item1) {001}
  let(:item2) {002}
  let(:item3) {003}

  let(:basket) {[product1,product2,product3]}
  let(:checkout_basket) {[["Lavender Heart", 9.25], ["Personalised cufflinks", 45.0], ["Kids T-shirt", 19.95]]}
  let(:checkout_basket_lavender) {[["Lavender Heart", 9.25], ["Lavender Heart", 9.25], ["Lavender Heart", 9.25],["Kids T-shirt", 19.95]]}


  describe "#ten_percent_discount" do
    it "deducts 10% of the total if you spend over £60" do
      expect(subject.ten_percent_discount? checkout_basket).to eq true
    end
  end
  describe "#basket_total" do
    it "sums up the total of all the items in the basket" do
      expect(subject.basket_totaller checkout_basket).to eq 74.2
    end
  end

  describe "#two_or_more_lavender_hearts?" do
    it "returns true if more than two lavender hearts" do
      subject.scan item1
      subject.scan item1
      expect(subject.discount? checkout_basket_lavender).to be_truthy
      expect(subject.discount? checkout_basket).to be_falsey
    end
  end


  describe "#scan" do
    it "scans the items" do

      subject.scan item1
      subject.scan item2
      expect(subject.scan item3).to eq [["Lavender Heart", 9.25], ["Personalised cufflinks", 45.0], ["Kids T-shirt", 19.95]]

    end
  end



end
