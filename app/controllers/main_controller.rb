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
    
    @pages = Page.find(:all, :order => 'name')
  end
  
  def show_page
    @page = Page.find(params[:id])
  end
  
  def search
    @term = params[:search].downcase
    terms = @term.split
    @listings = []
    
    terms.each { |term| 
      search_term = "%#{term}%"
      listings = Listing.find(:all, :conditions => [
      'lower(title) like ? or lower(body) like ? or lower(whoby) like ? or lower(email) like ?', search_term,search_term,search_term,search_term])
      @listings += listings
    }
  end
  
  def index
  end
  
  def show_category
    @category = Category.find(params[:id])
    @listings = Listing.find(:all, :conditions => "category_id = #{@category.id}")
  end

  def show_subcategory
    @subcategory = Subcategory.find(params[:id])
    @category = @subcategory.category
    @listings = @subcategory.listings
  end

end
