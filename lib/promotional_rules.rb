class PromotionalRules

  PRODUCT_ON_OFFER = "Lavender Heart"
  PRODUCT_ON_OFFER_QTY = 2
  DISCOUNT_PRICE = 8.50
  DISCOUNT_TOTAL = 60
  DISCOUNT_PERCENTAGE = 0.9

  def discount_promotion basket
    discount_qualified?(basket) ? discount_price_changer(basket) : basket
  end

  def ten_percent_promotion total
    ten_percent_discount?(total) ? remove_ten_percent(total) : total
  end

  def ten_percent_discount? total
    total > DISCOUNT_TOTAL
  end

  def remove_ten_percent total
    total * DISCOUNT_PERCENTAGE
  end

  def discount_qualified? basket, offer_product = PRODUCT_ON_OFFER, quantity = PRODUCT_ON_OFFER_QTY
    item_count = Hash.new(0)
    basket.each{ |item| item_count[offer_product]+=1  if item[0] == offer_product }
    item_count[offer_product] >= quantity
  end

  def discount_price_changer basket, new_price = DISCOUNT_PRICE, offer_product = PRODUCT_ON_OFFER
    basket.each do |items|
      items[0] == offer_product ? items[1] = new_price : items[1] = items[1]
    end
  end

end
