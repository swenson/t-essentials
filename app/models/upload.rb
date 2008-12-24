class Upload < ActiveRecord::Base
  belongs_to :contract
  belongs_to :category
  belongs_to :subcategory
  
  has_attachment :storage => :s3,
                 :size => 1..(10.megabytes)

  validates_as_attachment

  def to_s
    ret = ""
    ret += " (#{category})" unless category_id.nil?
    ret += " (#{subcategory})" unless subcategory_id.nil?
    ret += " "
    ret += filename
    ret.strip
  end
  
end
