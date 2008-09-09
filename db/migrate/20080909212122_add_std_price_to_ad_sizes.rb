class AddStdPriceToAdSizes < ActiveRecord::Migration
  def self.up
    add_column :adsizes, :standardprice, :decimal
  end

  def self.down
    remove_column :adsizes, :standardprice
  end
end
