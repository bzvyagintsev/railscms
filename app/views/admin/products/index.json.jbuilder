json.products @all_products do |product|

  json.id product.id
  json.title product.title
  json.description product.description
  json.price product.price
  json.weight product.weight
  json.length product.length
  json.height product.height
  json.width product.width
  json.active product.active
  json.seo_title product.seo_title
  json.seo_description product.seo_description

  json.url url_for(product)

  json.thumb do
	  json.url product.cover.admin_thumb.url
  end

  json.cover do
    json.url product.cover.url
  end

  json.category do
    if product.products_category.present?
      json.id product.products_category.id
      json.title product.products_category.title 
      json.url url_for(product.products_category) 
    else
      json.title 'Без категории' 
    end

  end
end