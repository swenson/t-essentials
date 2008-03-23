class Transaction < ActiveRecord::Base
  belongs_to :adsize
  belongs_to :designer
  belongs_to :client
  belongs_to :salesperson
  belongs_to :category
  belongs_to :subcategory
  
  validates_numericality_of :amountdue
  validates_numericality_of :amountpaid
  validates_numericality_of :balance

end
