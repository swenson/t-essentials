class CreateCharges < ActiveRecord::Migration
  def self.up
    create_table :charges do |t|
      t.references :contract
      t.decimal :amount
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :charges
  end
end
