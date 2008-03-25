class AddContractToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :contract_id, :integer
  end
  def self.down
    remove_column :listings, :contract_id
  end
end
