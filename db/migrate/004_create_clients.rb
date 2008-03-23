class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :business
      t.string :lastname
      t.string :firstname
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :email
      t.string :website
      t.text :comments
 
      t.timestamps
    end
  end
 
  def self.down
    drop_table :clients
  end
end