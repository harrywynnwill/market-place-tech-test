require "checkout"
RSpec.describe Checkout do

  subject(:checkout) {Checkout.new(promotional_rules)}
  let(:promotional_rules) {instance_spy("PromotionalRules")}

  let(:product1) {{product_code: 001, name: "Lavender Heart", price: 9.25} }
  let(:product2) {{product_code: 002, name: "Personalised cufflinks", price: 45.00}}
  let(:product3) {{product_code: 003, name: "Kids T-shirt", price: 19.95}}

  let(:item1) {001}
  let(:item2) {002}
  let(:item3) {003}

  let(:basket_with_product1) {[["Lavender Heart", 9.25]]}

  let(:basket_with_all_products) {[["Lavender Heart", 9.25], ["Personalised cufflinks", 45.0], ["Kids T-shirt", 19.95]]}

  describe "#scan" do
    it "scans the items and adds them to a basket" do
      subject.scan item1
      subject.scan item2
      subject.scan item3
      expect(subject.basket).to eq basket_with_all_products
    end
  end

  describe "#total" do
    it "returns the total of the basket" do
      allow(promotional_rules).to receive(:ten_percent_promotion).and_return(9.25)
      subject.scan item1
      expect(subject.total).to eq "£9.25"
      expect(promotional_rules).to have_received(:discount_promotion).with(array_including(basket_with_product1))
      expect(promotional_rules).to have_received(:ten_percent_promotion).with(9.25)
    end
  end
end
