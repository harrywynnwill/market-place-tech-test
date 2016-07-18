

class Checkout


  PRODUCTS = [{product_code: 001, name: "Lavender Heart", price: 9.25},
    {product_code: 002, name: "Personalised cufflinks", price: 45.00},
    {product_code: 003, name: "Kids T-shirt", price: 19.95}]

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
  end


  def scan(item)
    @promotional_rules.scan item
  end

  def total
    @promotional_rules.total
  end

end
