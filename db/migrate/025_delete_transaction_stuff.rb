class DeleteTransactionStuff < ActiveRecord::Migration
  def self.up
    drop_table :modalities
    drop_table :states
    drop_table :cities
    drop_table :transactions
  end

  def self.down
  end
end
