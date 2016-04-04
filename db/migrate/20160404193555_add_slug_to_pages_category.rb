class AddSlugToPagesCategory < ActiveRecord::Migration
  def change
    add_column :pages_categories, :slug, :string
  end
end
