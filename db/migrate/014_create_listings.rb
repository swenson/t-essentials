class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.string :title
      t.text :body
      t.string :by
      t.string :email
      t.datetime :start
      t.datetime :end
      t.references :region
      t.references :category
      t.references :subcategory

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
