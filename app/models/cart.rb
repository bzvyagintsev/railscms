class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
      # current_item = line_items.build(product_id: product_id)
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_v
    line_items.to_a.sum { |item| item.total_v }.round(2)
  end

  def total_kg
    line_items.to_a.sum { |item| item.total_kg }.round(1)
  end
end
