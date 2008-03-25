class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.datetime :contractdate
      t.references :client
      t.references :salesperson
      t.references :designer
      t.boolean :clientapproved
      t.boolean :certlistedoncontract

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
