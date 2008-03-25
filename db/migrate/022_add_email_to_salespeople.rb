class AddEmailToSalespeople < ActiveRecord::Migration
  def self.up
    add_column :salespeople, :email, :string
  end
  def self.down
    remove_column :salespeople, :email
  end

end
