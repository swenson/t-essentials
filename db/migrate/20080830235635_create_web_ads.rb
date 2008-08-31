class CreateWebAds < ActiveRecord::Migration
  def self.up
    create_table :web_ads do |t|
      t.string :name
      t.string :kindof
      t.datetime :startdate
      t.datetime :enddate
      t.text :content
      t.references :contract

      t.timestamps
    end
  end

  def self.down
    drop_table :web_ads
  end
end
