json.orders @orders do |order|
  json.id order.id
  json.name order.name
  json.created_at order.created_at.strftime('%d-%m-%Y %H:%M:%S')
  json.total_price order.total_price
  json.status order.status
end