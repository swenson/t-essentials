class RenameByInListings < ActiveRecord::Migration
  def self.up
    rename_column :listings, :by, :whoby
  end

  def self.down
    rename_column :listings, :whoby, :by
  end
end
