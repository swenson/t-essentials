class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name

      t.timestamps
    end
    
    Region.create(:id => 1, :name => 'Front Range, CO')
    Region.create(:id => 2, :name => 'Southern Colorado')
    Region.create(:id => 3, :name => 'San Antonio, TX')
    Region.create(:id => 4, :name => 'New Orleans, LA')
  end

  def self.down
    drop_table :regions
  end
end
