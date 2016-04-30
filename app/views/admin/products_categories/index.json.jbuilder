json.products_categories @products_categories do |category|

  json.id category.id
  json.lft category.lft
  json.rgt category.rgt
  json.depth category.depth
  json.title category.title
  json.description category.description
  json.active category.active
  # json.parent category.parent
  json.self_and_ancestors category.self_and_ancestors
  json.seo_title category.seo_title
  json.seo_description category.seo_description

  json.url url_for(category)

end