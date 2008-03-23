class Designer < ActiveRecord::Base
  has_many :transactions
  
  def name
    "#{firstname} #{lastname}"
  end
end
