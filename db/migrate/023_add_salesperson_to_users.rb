class AddSalespersonToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :salesperson_id, :integer
  end
  def self.down
    remove_column :users, :salesperson_id
  end
end
