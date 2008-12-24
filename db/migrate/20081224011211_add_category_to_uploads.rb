class AddCategoryToUploads < ActiveRecord::Migration
  def self.up
    add_column :uploads, :category_id, :integer
    add_column :uploads, :subcategory_id, :integer
  end

  def self.down
    remove_column :uploads, :category_id
    remove_column :uploads, :subcategory_id
  end
end
