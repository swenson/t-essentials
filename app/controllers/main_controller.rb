class MainController < ApplicationController
  before_filter :collect_info
  
  def collect_info    
    @regions = Region.find(:all)
    @categories = Category.find(:all, :order => 'name')

    @cat_thirds = [[],[],[]]
    for i in 0..(@categories.length - 1)
      @cat_thirds[i % 3] += [@categories[i]]
    end

    @reg_thirds = [[],[],[]]
    for i in 0..(@regions.length - 1)
      @reg_thirds[i % 3] += [@regions[i]]
    end
  end
  
  def index
  end
  
  def show_category
    @category = Category.find(params[:id])
    @listings = Listing.find(:all, :conditions => "category_id = #{@category.id}")
  end
end
