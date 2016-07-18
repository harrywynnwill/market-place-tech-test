class PromotionalRules

  PRODUCT_CODE = :product_code
  PRICE = :price
  DISCOUNT_TOTAL = 60
  PRODUCT_ON_OFFER = "Lavender Heart"
  PRODUCT_ON_OFFER_QTY = 2
  PRODUCTS = [{product_code: 001, name: "Lavender Heart", price: 9.25},
    {product_code: 002, name: "Personalised cufflinks", price: 45.00},
    {product_code: 003, name: "Kids T-shirt", price: 19.95}]


  def initialize
    @basket = []

  end
  def ten_percent_discount? basket
      basket_total = basket_totaller basket
      basket_total > DISCOUNT_TOTAL
  end

  def discount? basket, offer = PRODUCT_ON_OFFER, quantity = PRODUCT_ON_OFFER_QTY
    counts = Hash.new(0)
     basket.each{|item| item[0] == offer ? counts["offer"]+=1 : "" }
    # p basket.eachcount("Lavender Heart")
     p counts["offer"]

  end



  def scan item, products = PRODUCTS

    products.each do |product|
      item == product[:product_code] ? @basket << [product[:name],product[:price]]: ""
   end
   @basket
  end

  def basket_totaller basket
    basket.map{|item, price|  price}.inject{ |acc , item| acc += item }

  end





end
