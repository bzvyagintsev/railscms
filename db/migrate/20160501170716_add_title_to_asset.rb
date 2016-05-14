class AddTitleToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :title, :string
  end
end
