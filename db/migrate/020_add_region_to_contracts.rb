class AddRegionToContracts < ActiveRecord::Migration
  def self.up
    add_column :contracts, :region_id, :integer
  end
 
  def self.down
    remove_column :contracts, :region_id
  end
end