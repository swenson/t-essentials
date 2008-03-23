class CreateAdsizes < ActiveRecord::Migration
  def self.up
    create_table :adsizes do |t|
      t.string :adsize
      t.integer :numlistings

      t.timestamps
    end
    
    Adsize.create(:id => 1, :adsize => '1-inch box', :numlistings => 0)
    Adsize.create(:id => 2, :adsize => '1/8-page', :numlistings => 2)
    Adsize.create(:id => 3, :adsize => '1/4-page vertical', :numlistings => 3)
    Adsize.create(:id => 4, :adsize => '1/4-page horizontal', :numlistings => 3)
    Adsize.create(:id => 5, :adsize => '1/2-page', :numlistings => 4)
    Adsize.create(:id => 6, :adsize => '1-page full', :numlistings => 6)
    Adsize.create(:id => 7, :adsize => 'inside front cover', :numlistings => 3)
    Adsize.create(:id => 8, :adsize => 'inside back cover', :numlistings => 3)
    Adsize.create(:id => 9, :adsize => 'back cover', :numlistings => 3)
    Adsize.create(:id => 10, :adsize => 'web-only', :numlistings => 1)
    Adsize.create(:id => 11, :adsize => 'listing (s)', :numlistings => 1)
    
  end

  def self.down
    drop_table :adsizes
  end
end
