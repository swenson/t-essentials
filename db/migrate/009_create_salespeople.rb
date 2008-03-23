class CreateSalespeople < ActiveRecord::Migration
  def self.up
    create_table :salespeople do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.integer :numberofads

      t.timestamps
    end
  end

  def self.down
    drop_table :salespeople
  end
end
