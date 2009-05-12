class AddLongDescriptionToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :long_description, :text
    add_column :subcategories, :long_description, :text
  end

  def self.down
    remove_column :categories, :long_description
    remove_column :subcategories, :long_description
  end
end
