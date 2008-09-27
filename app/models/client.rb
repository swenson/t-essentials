class Client < ActiveRecord::Base
  has_many :contracts
  
  validates_presence_of :business
  
  def normalname
    if lastname and firstname
      "#{firstname} #{lastname} (#{business})"
    elsif lastname
      "#{lastname} (#{business})"
    elsif firstname
      "#{firstname} (#{business})"
    else
      "(#{business})"
    end
  end
  
  def name
    if lastname and firstname
      "#{lastname}, #{firstname} (#{business})"
    elsif lastname
      "#{lastname} (#{business})"
    elsif firstname
      "#{firstname} (#{business})"
    else
      "(#{business})"
    end
  end
end
