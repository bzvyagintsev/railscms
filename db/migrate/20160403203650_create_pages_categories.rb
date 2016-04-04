class CreatePagesCategories < ActiveRecord::Migration
  def self.up
    create_table :pages_categories do |t|
      t.string :title
      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true

      # optional fields
      t.integer :depth, :null => false, :default => 0
      t.integer :children_count, :null => false, :default => 0
    end
  end

  def self.down
    drop_table :pages_categories
  end
end