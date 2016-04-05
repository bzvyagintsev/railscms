class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :title
    	t.text :description
    	t.decimal  :price,      precision: 8, scale: 2
    	t.integer  :products_category_id
    	t.string   :cover
    	t.boolean  :active,                                default: true
    	t.string :slug
    	t.timestamps null: false
    end
  end
end
