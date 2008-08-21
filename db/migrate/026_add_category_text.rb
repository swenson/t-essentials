class AddCategoryText < ActiveRecord::Migration
  def self.up
    add_column :categories, :description, :text

    add_column :subcategories, :description, :text
  end
 
  def self.down
    remove_column :categories, :description
    
    remove_column :subcategories, :description
  end
end