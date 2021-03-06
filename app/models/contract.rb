class Contract < ActiveRecord::Base
  has_many :charges
  has_many :payments
  has_many :comments
  has_many :listings
  has_many :ads
  has_many :web_ads
  has_many :listings
  has_many :uploads
  
  belongs_to :client
  belongs_to :designer
  belongs_to :salesperson
  belongs_to :region
  
  def listings_allowed
    sum = 0
    ads.each { |ad| sum += ad.adsize.numlistings }
    return sum
  end
  
  def sum_payments
    sum = 0.0
    payments.each { |p| sum += p.amount }
    return sum
  end
  
  def sum_charges
    sum = 0.0
    charges.each { |c| sum += c.amount }
    return sum
  end
  
  def amount_due
    sum_charges - sum_payments
  end
  
  def due_date
    if paymentduedate
      d = paymentduedate
    else
      d = 90.days.from_now
    end
    "#{d.month}/#{d.day}/#{d.year}"
  end
end
