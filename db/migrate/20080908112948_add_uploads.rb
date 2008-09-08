class AddUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.integer :contract_id
      t.string :content_type
      t.string :filename
      t.string :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height
      
      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end