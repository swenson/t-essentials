class Salesperson < ActiveRecord::Base
  has_many :transactions
  has_many :contracts
  has_one :user
  
  
  def sum_ads
    sum = 0
    contracts.collect { |c| sum += c.ads.length }
    return sum
  end
  
  def name
    "#{firstname} #{lastname}"
  end
end
