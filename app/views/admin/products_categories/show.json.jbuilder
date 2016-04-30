json.products_category do
  json.id @products_category.id
  json.title @products_category.title
  json.description @products_category.description
  json.active @products_category.active
  json.seo_title @products_category.seo_title
  json.seo_description @products_category.seo_description


  json.url url_for(@products_category)

  # json.thumb do
	 #  json.url @products_category.cover.admin_thumb.url
  # end

  # json.cover do
  #   json.url @products_category.cover.url
  # end

end

