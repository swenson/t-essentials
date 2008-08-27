class AddDueDateToContract < ActiveRecord::Migration
  def self.up
    add_column :contracts, :paymentduedate, :datetime
  end
 
  def self.down
    remove_column :categories, :paymentduedate
  end
end
