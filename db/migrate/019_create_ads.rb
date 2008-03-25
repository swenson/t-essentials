class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.references :contract
      t.references :adsize
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :ads
  end
end
