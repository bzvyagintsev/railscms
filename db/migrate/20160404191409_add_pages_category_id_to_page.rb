class AddPagesCategoryIdToPage < ActiveRecord::Migration
  def change
    add_column :pages, :pages_category_id, :integer
  end
end
