class CreateModalities < ActiveRecord::Migration
  def self.up
    create_table :modalities do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
    
    apc = Modality.create(:name => 'Animal & Pet Care')
    Modality.create(:name => 'Arts & Entertainment')
    Modality.create(:name => 'Beauty & Personal Care')
    Modality.create(:name => 'Body Work')
    Modality.create(:name => 'Business & Professional')
    Modality.create(:name => 'Churches & Centers')
    Modality.create(:name => 'Coaching')
    Modality.create(:name => 'Counseling & Psychotherapy')
    Modality.create(:name => 'Education')
    Modality.create(:name => 'Energy Work')
    Modality.create(:name => 'Events & Fairs')
    Modality.create(:name => 'Fitness & Outdoors')
    Modality.create(:name => 'Food')
    Modality.create(:name => 'Health Care')
    Modality.create(:name => 'Herbs & Supplements')
    Modality.create(:name => 'Holistic Health')
    Modality.create(:name => 'Home & Environment')
    Modality.create(:name => 'Metaphysical')
    Modality.create(:name => 'Retail')
    Modality.create(:name => 'Services')
    Modality.create(:name => 'Spiritual')
    Modality.create(:name => 'Travel')

    Modality.create(:name => 'Animal Acupressure', :parent_id => apc.id)

    
  end

  def self.down
    drop_table :modalities
  end
end
