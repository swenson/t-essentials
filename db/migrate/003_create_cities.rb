class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name
      t.references :state

      t.timestamps
    end
    
    colorado = State.find(:first, :conditions => "name = 'Colorado'")
    
    City.create(:name => 'Colorado Springs', :state_id => colorado.id)
    City.create(:name => 'Denver', :state_id => colorado.id)
    City.create(:name => 'Pueblo', :state_id => colorado.id)
  end

  def self.down
    drop_table :cities
  end
end
