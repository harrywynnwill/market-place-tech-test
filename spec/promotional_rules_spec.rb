require "promotional_rules"

RSpec.describe PromotionalRules do

  subject(:promotional_rules) {PromotionalRules.new}

  let(:checkout_basket) {[["Lavender Heart", 9.25], ["Personalised cufflinks", 45.0], ["Kids T-shirt", 19.95]]}
  let(:checkout_discount) {[["Lavender Heart", 9.25], ["Lavender Heart", 9.25], ["Lavender Heart", 9.25],["Kids T-shirt", 19.95]]}
  let(:checkout_discount_applied) {[["Lavender Heart", 8.50], ["Lavender Heart", 8.50], ["Lavender Heart", 8.50],["Kids T-shirt", 19.95]]}

  describe "#discount_promotion" do
    it "checks the basket and adjusts accordingly" do
      expect(subject.discount_price_changer checkout_discount).to eq  checkout_discount
      expect(subject.discount_price_changer checkout_discount).to eq  checkout_discount_applied
    end
  end

  describe "#ten_percent_promotion" do
    it "checks to see if the total is due for 10% and makes adjustments" do
      expect(subject.ten_percent_promotion 100).to eq 90
      expect(subject.ten_percent_promotion 59).to eq 59
    end
  end

  describe "#discount_qualified?" do
    it "returns true if more than two lavender hearts" do
      expect(subject.discount_qualified? checkout_discount).to be_truthy
      expect(subject.discount_qualified? checkout_basket).to be_falsey
    end
  end

  describe "#ten_percent_discount?" do
    it "checks to seee if you qualify for the 10% discout" do
      expect(subject.ten_percent_discount? 65).to be_truthy
    end
  end

  describe "#remove_ten_percent" do
    it "removes 10% off the total bill" do
      expect(subject.remove_ten_percent 100).to eq 90
    end
  end

  describe "#discount_price_changer" do
    it "changes the price of the product on discout" do
      expect(subject.discount_price_changer checkout_basket).to eq checkout_basket

    end
  end
end
