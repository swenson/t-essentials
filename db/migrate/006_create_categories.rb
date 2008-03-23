class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

Category.create(:id => 1, :name => 'Animal & Pet Care')
Category.create(:id => 21, :name => 'Arts & Entertainment')
Category.create(:id => 2, :name => 'Beauty & Personal Care')
Category.create(:id => 3, :name => 'Bodywork')
Category.create(:id => 4, :name => 'Business & Professional')
Category.create(:id => 5, :name => 'Children, Family, Women & Men')
Category.create(:id => 6, :name => 'Churches & Centers')
Category.create(:id => 7, :name => 'Counseling')
Category.create(:id => 8, :name => 'Education')
Category.create(:id => 9, :name => 'Energy Work')
Category.create(:id => 20, :name => 'Environmental')
Category.create(:id => 10, :name => 'Events & Travel')
Category.create(:id => 11, :name => 'Fitness')
Category.create(:id => 12, :name => 'Food')
Category.create(:id => 22, :name => 'Herbs & Supplements')
Category.create(:id => 13, :name => 'Holistic Healing')
Category.create(:id => 14, :name => 'Home & Garden')
Category.create(:id => 15, :name => 'Medicine- Complimentary')
Category.create(:id => 16, :name => 'Medicine- Traditional Western')
Category.create(:id => 17, :name => 'Metaphysical')
Category.create(:id => 23, :name => 'Publishing & Publications')
Category.create(:id => 24, :name => 'Real Estate')
Category.create(:id => 18, :name => 'Retail')
Category.create(:id => 19, :name => 'Spiritual')
Category.create(:id => 25, :name => 'Travel')
  end

  def self.down
    drop_table :categories
  end
end
