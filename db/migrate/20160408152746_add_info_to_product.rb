class AddInfoToProduct < ActiveRecord::Migration
  def change
    add_column :products, :length, :decimal,                precision: 8, scale: 2
    add_column :products, :height, :decimal,                precision: 8, scale: 2
    add_column :products, :width, :decimal,                precision: 8, scale: 2
    add_column :products, :weight, :decimal,                precision: 8, scale: 2
    add_column :products, :brand, :string
  end
end
