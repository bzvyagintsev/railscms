class Order < ActiveRecord::Base
  enum status: [ :progress, :paid, :completed, :canceled ]

  # obfuscate_id

  has_many :line_items, dependent: :destroy
  # belongs_to :shipment_method
  # belongs_to :payment_method
  # belongs_to :user

  # validates :name, :telephone, :email, presence: true
  validates :name, presence: true

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def create_line_item(product_id, quantity)
    if product_id.present?
      current_item = line_items.build(product_id: product_id, quantity: quantity)
      line_items << current_item
    end
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
