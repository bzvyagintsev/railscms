crumb :admin do
  link "Панель управления", admin_root_path
end
crumb :admin_settings do
  link "Настройки", admin_settings_path
  parent :admin
end
crumb :admin_products do
  link "Товары", admin_products_path
  parent :admin
end
crumb :admin_pages do
  link "Страницы", admin_pages_path
  parent :admin
end
crumb :admin_products_categories do
  link "Категории товары", admin_products_categories_path
  parent :admin
end
crumb :admin_pages_categories do
  link "Категории страниц", admin_pages_categories_path
  parent :admin
end
crumb :admin_orders do
  link "Заказы", admin_orders_path
  parent :admin
end