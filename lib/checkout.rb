

class Checkout

  PRODUCT_CODE = :product_code
  PRICE = :price
  NAME = :name
  NUMBER_FORMAT = "%.2f"
  PRODUCTS = [{product_code: 001, name: "Lavender Heart", price: 9.25},
    {product_code: 002, name: "Personalised cufflinks", price: 45.00},
    {product_code: 003, name: "Kids T-shirt", price: 19.95}]

    attr_reader :basket

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @basket = []
  end


  def scan item, products = PRODUCTS
    products.each do |product|
    @basket << [product[NAME], product[PRICE]] if item == product[PRODUCT_CODE]
   end
  end

  def total
     @promotional_rules.discount_promotion @basket
     total = basket_totaller @basket
     @promotional_rules.ten_percent_promotion total
     currency_formatter total
  end

  private

  def basket_totaller basket
    basket.map{|item, price| price}.inject{ |acc , item| acc += item }
  end

  def currency_formatter number
    NUMBER_FORMAT % number
  end


end
