class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.datetime :addate
      t.references :adsize
      t.references :category
      t.references :subcategory
      t.boolean :clientapproval
      t.references :salesperson
      t.references :client
      t.decimal :amountdue
      t.decimal :amountpaid
      t.decimal :balance
      t.integer :numlistings
      t.references :designer

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
