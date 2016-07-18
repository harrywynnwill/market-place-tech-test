class PromotionalRules

  PRODUCT_CODE = :product_code
  PRICE = :price
  DISCOUNT_TOTAL = 60
  PRODUCT_ON_OFFER = "Lavender Heart"
  PRODUCT_ON_OFFER_QTY = 2
  DISCOUNT_PRICE = 8.50
  PRODUCTS = [{product_code: 001, name: "Lavender Heart", price: 9.25},
    {product_code: 002, name: "Personalised cufflinks", price: 45.00},
    {product_code: 003, name: "Kids T-shirt", price: 19.95}]


    attr_reader :basket


  def initialize
    @basket = []

  end
  def ten_percent_discount? total
      total > DISCOUNT_TOTAL
  end

  def discount? basket, offer = PRODUCT_ON_OFFER, quantity = PRODUCT_ON_OFFER_QTY
    counts = Hash.new(0)
     basket.each{|item| item[0] == offer ? counts[offer]+=1 : "" }
    # p basket.eachcount("Lavender Heart")
      counts[offer] > quantity

  end

  def discount_price_changer basket, new_price = DISCOUNT_PRICE, offer = PRODUCT_ON_OFFER
    basket.each do |items|
      items[0] == offer ? items[1] = new_price : items[1] = items[1]
      #  p items[0] == offer ? items[1] = new_price : items[1] = price



# item == offer item = item && price = new_price : item = item && price = price
        # if item == offer
        #   price = new_price

       end
    # end
    basket
  end



  def scan item, products = PRODUCTS

    products.each do |product|
      item == product[:product_code] ? @basket << [product[:name],product[:price]]: ""
   end
   @basket
  end

  def basket_totaller basket
    basket.map{|item, price| price}.inject{ |acc , item| acc += item }

  end
  def remove_ten_percent basket
    basket * 0.9
  end

  def total
     discount_price_changer if discount? @basket

      total = basket_totaller @basket

      p total
     remove_ten_percent total if ten_percent_discount? total
  end




end
