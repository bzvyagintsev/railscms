class AddSeoToProductsAndProductsCategories < ActiveRecord::Migration
  def change
    add_column :products, :seo_title, :string
    add_column :products, :seo_description, :string
    add_column :products_categories, :seo_title, :string
    add_column :products_categories, :seo_description, :string
  end
end
