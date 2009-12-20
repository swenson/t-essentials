class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
    
    #State.create(:name => 'Colorado', :abbreviation => 'CO')
    #State.create(:name => 'Louisiana', :abbreviation => 'LA')
  end

  def self.down
    drop_table :states
  end
end
