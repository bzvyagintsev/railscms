class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart


  def total_price
    if product
      if product.price
  	   product.price * quantity.to_i
      end
    else
      return 0
    end
  end

  def total_v
    if product
      if product.length && product.height && product.width
        (product.length * product.height * product.width) / 100000 * quantity
      end
    else
      return 0
    end
  end

  def total_kg
    if product
      if product.weight
        product.weight * quantity
      end
    else
      return 0
    end
  end
end