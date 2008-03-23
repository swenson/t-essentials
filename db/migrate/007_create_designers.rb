class CreateDesigners < ActiveRecord::Migration
  def self.up
    create_table :designers do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone

      t.timestamps
    end
    
Designer.create(:id => 1, :firstname => 'Laurie', :lastname => 'Anderson', :address => '',
  :city => 'Woodland Park', :state => 'CO', :zip => 80866, :phone => '719.471.3071')
Designer.create(:id => 2, :firstname => 'Jaye', :lastname => 'Garcia', :address => '',
  :city => 'Colorado Springs', :state => 'CO', :zip => 80907, :phone => '719.447.8789')

Designer.create(:id => 3, :firstname =>'Samantha',:lastname =>'Bachechi', :address => '',
  :city => 'Colorado Springs', :state => 'CO', :phone => '719.266.9330')

Designer.create(:id => 4, :firstname => 'Bruce', :lastname => 'Hilvitz', :address => '',
  :city => 'Pueblo', :state => 'CO', :phone => '719.564.2106')
  end

  def self.down
    drop_table :designers
  end
end
