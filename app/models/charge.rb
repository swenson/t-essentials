class Charge < ActiveRecord::Base
  belongs_to :contract
  validates_presence_of :comment
  validates_numericality_of :amount, :greater_than_or_equal_to => 0.0
end
